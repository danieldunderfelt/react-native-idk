package com.danieldunderfelt.Idk

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class IdkModule internal constructor(context: ReactApplicationContext) :
  IdkSpec(context) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  override fun generate(input: String, promise: Promise) {
    promise.resolve(input)
  }

  companion object {
    const val NAME = "Idk"
  }
}
