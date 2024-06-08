#ifdef __cplusplus
#import "react-native-idk.h"
#endif

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNIdkSpec.h"

@interface Idk : NSObject <NativeIdkSpec>
#else
#import <React/RCTBridgeModule.h>

@interface Idk : NSObject <RCTBridgeModule>
#endif

@end
