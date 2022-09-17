package com.hongri.startup_namer

import android.os.Bundle
import android.util.Log
import com.google.gson.Gson
import com.hongri.startup_namer.info.PersonInfo
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainFlutterActivity : BaseFlutterActivity() {
    private var name: String? = ""
    private var age: Int? = 0

    companion object {
        const val TAG = "MainFlutterActivity";
        const val INTERACTION_CHANNEL = "interaction_channel"
        const val INTERACTION_METHOD_ONE = "interaction_method_one"
        const val INTERACTION_METHOD_TWO = "interaction_method_two"
        const val ROUTE_NAME_MAIN_FLUTTER = "route_name_main_flutter"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

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
        var methodChannel = MethodChannel(flutterEngine.dartExecutor, INTERACTION_CHANNEL)
        methodChannel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            onMethodRealCall(methodCall, result)
        }
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
