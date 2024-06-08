#import "Idk.h"

@implementation Idk
RCT_EXPORT_MODULE()

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (NSString *)generate:(NSString *)input {
    // Convert NSString to std::string
    std::string cppInput = [input UTF8String];
    // Call the C++ function
    std::string cppResult = idk::generate(cppInput);
    // Convert std::string back to NSString
    NSString *result = [NSString stringWithUTF8String:cppResult.c_str()];
    return result;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeIdkSpecJSI>(params);
}
#endif

@end
