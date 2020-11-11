package com.evolvingkid.animeworld;

import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {
 
  private static final String CHANNEL = "EASYWALLPAPER";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
   // ? this will not be needed in some version. This code line => GeneratedPluginRegistrant.registerWith(this.getFlutterEngine());
  // new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
      //      new MethodChannel.MethodCallHandler() {
      //        @Override
       //       public void onMethodCall(MethodCall call, MethodChannel.Result result) {
       //         if (call.method.equals("wallppaersetter")) {
         //         System.out.print("Welcome"); 
          //      }
       //       }});
  }

}
