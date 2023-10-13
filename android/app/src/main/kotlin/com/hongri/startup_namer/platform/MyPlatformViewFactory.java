package com.hongri.startup_namer.platform;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * @author：zhongyao
 * @date：2023/8/17
 * @description：
 */
public class MyPlatformViewFactory extends PlatformViewFactory {
    public MyPlatformViewFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        return new MyPlatformView(context, viewId, creationParams);
    }
}
