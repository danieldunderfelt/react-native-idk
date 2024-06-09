package com.danieldunderfelt.idk;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = IdkModule.NAME)
public class IdkModule extends NativeIdkSpec {
  public static final String NAME = "Idk";

  public IdkModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }

  static {
    System.loadLibrary("react-native-idk");
  }

  private static native String nativeGenerate(String input);

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @Override
  public String generate(String input) {
    return nativeGenerate(input);
  }
}
