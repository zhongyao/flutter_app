package com.hongri.startup_namer

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_home.*

class HomeActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home)

        jumpToFlutterBtn.setOnClickListener {
            fromNativeJump2Flutter();
        }
    }

    private fun fromNativeJump2Flutter() {
        val intent = Intent(this, MainFlutterActivity::class.java)
        intent.putExtra("name", "yao")
        intent.putExtra("age", 18)
        startActivity(intent)
    }
}