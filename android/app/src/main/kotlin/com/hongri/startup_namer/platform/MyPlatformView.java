package com.hongri.startup_namer.platform;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

/**
 * @author：zhongyao
 * @date：2023/8/17
 * @description：
 */
class MyPlatformView implements PlatformView {

    private static String TAG = "MyPlatformView";
    private Button button;

    public MyPlatformView(Context context, int id, Map<String, Object> creationParams) {
        button = new Button(context);
        button.setVisibility(View.VISIBLE);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(152, 80);
        button.setLayoutParams(params);
        button.setText("AndroidView");
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "click MyPlatformView");
            }
        });
    }

    @Nullable
    @Override
    public View getView() {
        return button;
    }

    @Override
    public void dispose() {

    }
}
