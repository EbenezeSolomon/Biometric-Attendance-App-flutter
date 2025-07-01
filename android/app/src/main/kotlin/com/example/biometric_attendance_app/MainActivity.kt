package com.example.biometric_attendance_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.biometric_attendance_app/fingerprint"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "initializeScanner" -> {
                    // TODO: Implement scanner initialization here
                    // For now, we'll just return true
                    result.success(true)
                }
                "scanFingerprint" -> {
                    // TODO: Implement fingerprint scanning here
                    // For now, we'll just return true to simulate a successful scan
                    result.success(true)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}