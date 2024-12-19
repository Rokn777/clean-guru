package com.cleanguru.clean_guru

import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Environment
import android.os.StatFs
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class PlatformService(private val context: Context) : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "clean_guru/platform")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getBatteryInfo" -> getBatteryInfo(result)
            "getStorageInfo" -> getStorageInfo(result)
            "getMemoryInfo" -> getMemoryInfo(result)
            "optimizeDevice" -> optimizeDevice(result)
            else -> result.notImplemented()
        }
    }

    private fun getBatteryInfo(result: Result) {
        val batteryStatus: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { filter ->
            context.registerReceiver(null, filter)
        }

        val level = batteryStatus?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val scale = batteryStatus?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1
        val batteryPct = level * 100 / scale.toFloat()

        val status = batteryStatus?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
        val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                status == BatteryManager.BATTERY_STATUS_FULL

        val temp = batteryStatus?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, -1) ?: -1
        val temperature = temp / 10.0

        result.success(mapOf(
            "level" to batteryPct,
            "isCharging" to isCharging,
            "temperature" to temperature
        ))
    }

    private fun getStorageInfo(result: Result) {
        val stat = StatFs(Environment.getDataDirectory().path)
        val blockSize = stat.blockSizeLong
        val totalBlocks = stat.blockCountLong
        val availableBlocks = stat.availableBlocksLong

        val totalSpace = totalBlocks * blockSize
        val freeSpace = availableBlocks * blockSize
        val usedSpace = totalSpace - freeSpace

        result.success(mapOf(
            "totalSpace" to totalSpace,
            "usedSpace" to usedSpace,
            "freeSpace" to freeSpace
        ))
    }

    private fun getMemoryInfo(result: Result) {
        val activityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val memoryInfo = ActivityManager.MemoryInfo()
        activityManager.getMemoryInfo(memoryInfo)

        result.success(mapOf(
            "totalRam" to memoryInfo.totalMem,
            "usedRam" to (memoryInfo.totalMem - memoryInfo.availMem),
            "freeRam" to memoryInfo.availMem
        ))
    }

    private fun optimizeDevice(result: Result) {
        // Implement device optimization logic
        result.success(true)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}