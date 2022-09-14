package com.hongri.startup_namer

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

    companion object {
        const val TAG = "MainActivity";
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val intent = intent

        val name = intent?.getStringExtra("name")
        val age = intent?.getIntExtra("age", 12)

        Log.d(TAG, "name:$name age:$age")
    }
}
