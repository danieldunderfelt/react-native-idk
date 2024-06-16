#import "Idk.h"
#import "MLModelHandler.h"

@implementation Idk {
    MLModelHandler *_modelHandler;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(loadModel:(NSString *)modelName resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    _modelHandler = [[MLModelHandler alloc] initWithModelName:modelName];
    
    if (_modelHandler) {
        resolve(nil);
    } else {
        reject(@"load_model_error", @"Failed to load model", nil);
    }
}

RCT_EXPORT_METHOD(generate:(NSString *)inputString resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    if (!_modelHandler) {
        reject(@"no_model", @"Model not loaded", nil);
        return;
    }

    NSString *result = [_modelHandler generateWithInputString:inputString];
    if (result) {
        resolve(result);
    } else {
        reject(@"generation_error", @"Error generating output", nil);
    }
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeIdkSpecJSI>(params);
}
#endif

@end
