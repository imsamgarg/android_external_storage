package com.example.android_external_storage;

import android.os.Environment;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * AndroidExternalStoragePlugin
 */
public class AndroidExternalStoragePlugin implements FlutterPlugin, MethodCallHandler {

    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "android_external_storage");
        channel.setMethodCallHandler(this);
    }


    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "getExDirectory":
                result.success(Environment.getExternalStorageDirectory().getPath());
                break;
            case "getExPublicDirectory":
                result.success(Environment.getExternalStoragePublicDirectory(call.argument("type").toString()).getPath());
                break;
            case "getRootDirectory":
                result.success(Environment.getRootDirectory().getPath());
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
