#include <jni.h>
#include <string>
#include "react-native-idk.h"

extern "C" {
JNIEXPORT jstring JNICALL
Java_com_danieldunderfelt_idk_IdkModule_nativeGenerate(JNIEnv *env, jclass type, jstring input) {
    // Convert jstring to std::string
    const char *inputChars = env->GetStringUTFChars(input, nullptr);
    if (!inputChars) return nullptr; // Proper null check

    std::string cppInput(inputChars);
    env->ReleaseStringUTFChars(input, inputChars);

    // Call the C++ function
    std::string cppResult = idk::generate(cppInput);

    // Convert std::string back to jstring
    return env->NewStringUTF(cppResult.c_str());
}
}
