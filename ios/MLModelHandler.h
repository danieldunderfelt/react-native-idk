#import <Foundation/Foundation.h>
#import <CoreML/CoreML.h>

@interface MLModelHandler : NSObject

- (instancetype)initWithModelName:(NSString *)modelName;
- (NSString *)generateWithInputString:(NSString *)inputString;
- (MLMultiArray *)createMLMultiArrayFromString:(NSString *)inputString;
- (NSArray<NSNumber *> *)convertStringToArray:(NSString *)inputString;

@end
