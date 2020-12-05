package com.speed_of_img_endec;

import android.Manifest;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Environment;
import android.os.SystemClock;

import androidx.annotation.NonNull;

import java.io.ByteArrayOutputStream;
import java.io.File;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "speed_of_img_endec";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {

        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    String imageFilepath;
                    
                    switch (call.method) {

                        case "imageDecoding":

                            imageFilepath = call.argument("imageFilepath");
                            result.success(imageDecoding(imageFilepath));
                            break;

                        case "jpgEncoding":

                            imageFilepath = call.argument("imageFilepath");
                            result.success(jpgEncoding(imageFilepath));
                            break;

                        case "pngEncoding":

                            imageFilepath = call.argument("imageFilepath");
                            result.success(pngEncoding(imageFilepath));
                            break;
                            
                        default:
                            result.notImplemented();
                            break;
                    }
                }
        );
    }

    private int imageDecoding(String imageFilepath) {
        long startTime = SystemClock.elapsedRealtime();
        final Bitmap decodedImage = BitmapFactory.decodeFile(imageFilepath);
        long imageDecodingTime = SystemClock.elapsedRealtime() - startTime;

        return (int) imageDecodingTime;
    }

    private int jpgEncoding(String imageFilepath) {
        Bitmap decodedImage = BitmapFactory.decodeFile(imageFilepath);

        long startTime = SystemClock.elapsedRealtime();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        decodedImage.compress(Bitmap.CompressFormat.JPEG, 100, baos);
        long imageDecodingTime = SystemClock.elapsedRealtime() - startTime;

        return (int) imageDecodingTime;
    }

    private int pngEncoding(String imageFilepath) {
        Bitmap decodedImage = BitmapFactory.decodeFile(imageFilepath);

        long startTime = SystemClock.elapsedRealtime();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        decodedImage.compress(Bitmap.CompressFormat.PNG, 0, baos);
        long imageDecodingTime = SystemClock.elapsedRealtime() - startTime;

        return (int) imageDecodingTime;
    }

}
