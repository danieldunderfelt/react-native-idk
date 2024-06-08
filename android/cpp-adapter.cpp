#include <jni.h>
#include "react-native-idk.h"

extern "C"
JNIEXPORT jdouble JNICALL
Java_com_idk_IdkModule_nativeMultiply(JNIEnv *env, jclass type, jdouble a, jdouble b) {
    return idk::multiply(a, b);
}
