package com.hongri.startup_namer.util

import com.google.gson.Gson
import com.hongri.startup_namer.BaseFlutterActivity
import com.hongri.startup_namer.info.PlatformConfig

/**
 * @author：hongri
 * @date：9/14/22
 * @description：
 */
object PlatformUtil {

    fun getPlatformConfig(activity: BaseFlutterActivity) : String {
        val platformConfig = PlatformConfig()
        platformConfig.route_name = activity.getRouteName()
        platformConfig.app_version = "1.0.1"

        val json = Gson()
        return json.toJson(platformConfig);
    }
}