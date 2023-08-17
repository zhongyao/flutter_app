package com.hongri.startup_namer

import android.os.Bundle
import android.util.Log
import com.google.gson.Gson
import com.hongri.startup_namer.info.PersonInfo
import com.hongri.startup_namer.platform.MyPlatformViewFactory
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import java.util.Timer
import kotlin.concurrent.timerTask

/**
 * Flutter与Native三种通信方案
 *
 * 参考：https://www.jianshu.com/p/331cf2742cc6
 * MethodChannel 用于传递方法调用（method invocation），是flutter调取原生方法的,也可以原生主动传递数据给Flutter。
 * BasicMessageChannel 用于传递字符串和半结构化的信息。是两个端相互发送数据，接收数据的。
 * EventChannel 用于数据流（event streams）的通信。通长用于Nativie向flutter的通信，如：手机电量变化，网络连接变化，陀螺仪，传感器等;
 *
 */
class MainFlutterActivity : BaseFlutterActivity() {
    private var name: String? = ""
    private var age: Int? = 0
    private val viewType: String = "com.hongri.platform.view1";

    companion object {
        const val TAG = "yao";
        const val INTERACTION_CHANNEL = "interaction_channel"
        const val INTERACTION_BASIC_MESSAGE_CHANNEL = "interaction_basic_message_channel"
        const val INTERACTION_EVENT_CHANNEL = "interaction_event_channel"
        const val INTERACTION_METHOD_ONE = "interaction_method_one"
        const val INTERACTION_METHOD_ONE_FLUTTER = "interaction_method_one_flutter"
        const val INTERACTION_METHOD_TWO = "interaction_method_two"
        const val ROUTE_NAME_MAIN_FLUTTER = "route_name_main_flutter"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_main_flutter)

        val intent = intent
        name = intent?.getStringExtra("name")
        age = intent?.getIntExtra("age", 12)
        Log.d(TAG, "name:$name age:$age")
    }

    override fun getRouteName(): String {
        return ROUTE_NAME_MAIN_FLUTTER
    }

    /**
     * Native/Flutter交互
     */
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        //MethodChannel【双向通信】
        initMethodChannel(flutterEngine)

        //BasicMessageChannel【双向通信】
        initBasicMessageChannel(flutterEngine)

        //EventChannel【单向通信Native-->Flutter】
        initEventChannel(flutterEngine)

        registerViewFactory(this, flutterEngine)
    }

    private fun registerViewFactory(activity: MainFlutterActivity, flutterEngine: FlutterEngine) {
        flutterEngine.platformViewsController.registry.registerViewFactory(
            viewType,
            MyPlatformViewFactory()
        )
    }


    private fun initEventChannel(flutterEngine: FlutterEngine) {
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            INTERACTION_EVENT_CHANNEL
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                for (i in 0..10) {
                    events?.success(i)
                }
                events?.endOfStream()
            }

            override fun onCancel(arguments: Any?) {

            }
        })
    }

    private fun initBasicMessageChannel(flutterEngine: FlutterEngine) {
        var basicMessageChannel = BasicMessageChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            INTERACTION_BASIC_MESSAGE_CHANNEL,
            StandardMessageCodec()
        )

        /**
         * 【BasicMessageChannel】Flutter --> Native
         */
        basicMessageChannel.setMessageHandler { message, reply ->
            var map = message as Map<String, Any>
            var text = "BasicMessageChannel -- Flutter --> Native : ${map["name"]}, ${map["age"]}"
            Log.d(TAG, "text:$text")
            //被动回复 flutter 消息
            reply.reply("I get it")
        }

        /**
         * 【BasicMessageChannel】Native --> Flutter
         */
        Timer().schedule(timerTask {
            activity.runOnUiThread {
                //主动给 flutter 发消息
                basicMessageChannel.send("BasicMessageChannel--> 我还可以主动告诉你，我是个男的")
            }
        }, 2000, 3000)
    }

    private fun initMethodChannel(flutterEngine: FlutterEngine) {
        var methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, INTERACTION_CHANNEL)

        /**
         * 【MethodChannel】Flutter --> Native
         */
        methodChannel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            onMethodRealCall(methodCall, result)
        }

        /**
         * 【MethodChannel】Native --> Flutter
         */
        Timer().schedule(timerTask {
            activity.runOnUiThread {
                var map = mapOf("invoke_name" to "【MethodChannel】native --> flutter")
                methodChannel.invokeMethod(INTERACTION_METHOD_ONE_FLUTTER, map)

                Log.d(TAG, "native --> flutter:$INTERACTION_METHOD_ONE_FLUTTER")
            }
        }, 2000, 3000)
    }

    private fun onMethodRealCall(methodCall: MethodCall, result: MethodChannel.Result) {
        try {
            val methodName = methodCall.method
            Log.d(TAG, "methodName:$methodName")

            if (INTERACTION_METHOD_ONE == methodName) {
                interactMethodOne(methodCall, result)
            } else if (INTERACTION_METHOD_TWO == methodName) {

            } else {
                Log.e(TAG, "the method do not support interact yet!!!")
            }
        } catch (e: Exception) {

        }
    }

    private fun interactMethodOne(methodCall: MethodCall, result: MethodChannel.Result) {
        try {
            val personInfo = PersonInfo()
            personInfo.name = name
            personInfo.age = age

            val json = Gson()
            val toJson = json.toJson(personInfo)
            result.success(toJson)
        } catch (e: Exception) {
            result.error("interactMethod error", e.message, e.message)
        }
    }

}
