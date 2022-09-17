package com.hongri.startup_namer

import android.content.Context
import android.os.Bundle
import android.util.Log
import com.hongri.startup_namer.util.PlatformUtil
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

abstract class BaseFlutterActivity : FlutterActivity() {

    companion object {
        const val TAG = "BaseFlutterActivity"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_base_flutter)
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        Log.d(TAG, "provideFlutterEngine")
        val routeNameJson = PlatformUtil.getPlatformConfig(this)

        val flutterEngine = FlutterEngine(this)
        flutterEngine.navigationChannel.setInitialRoute(routeNameJson)
        flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())

        FlutterEngineCache.getInstance().put(routeNameJson, flutterEngine)
        return flutterEngine
    }

    abstract fun getRouteName(): String


}