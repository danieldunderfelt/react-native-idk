#import "MLModelHandler.h"

@interface MLModelHandler ()

@property (nonatomic, strong) MLModel *model;

@end

@implementation MLModelHandler

- (instancetype)initWithModelName:(NSString *)modelName {
    self = [super init];
    if (self) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:modelName withExtension:@"mlmodelc"];
        NSError *error;
        self.model = [MLModel modelWithContentsOfURL:modelURL error:&error];
        if (error) {
            NSLog(@"Error loading model: %@", error.localizedDescription);
            return nil;
        }
    }
    return self;
}

- (NSString *)generateWithInputString:(NSString *)inputString {
    NSError *error;
    // Assuming the input is a string that needs to be converted to an MLMultiArray or UIImage
    // Here we assume it's an MLMultiArray for demonstration purposes
    MLMultiArray *inputArray = [self createMLMultiArrayFromString:inputString];
    if (!inputArray) {
        NSLog(@"Error creating MLMultiArray from input string");
        return nil;
    }

    MLDictionaryFeatureProvider *inputProvider = [[MLDictionaryFeatureProvider alloc] initWithDictionary:@{@"input": inputArray} error:&error];
    if (error) {
        NSLog(@"Error creating input provider: %@", error.localizedDescription);
        return nil;
    }

    id<MLFeatureProvider> prediction = [self.model predictionFromFeatures:inputProvider error:&error];
    if (error) {
        NSLog(@"Error making prediction: %@", error.localizedDescription);
        return nil;
    }

    // Assuming the output is a string value
    MLFeatureValue *outputValue = [prediction featureValueForName:@"output"];
    if (outputValue && outputValue.type == MLFeatureTypeString) {
        return outputValue.stringValue;
    } else {
        NSLog(@"Error retrieving output value or output value is not a string");
        return nil;
    }
}

- (MLMultiArray *)createMLMultiArrayFromString:(NSString *)inputString {
    // Convert the string to an array of doubles (or any other required type)
    NSArray<NSNumber *> *inputArray = [self convertStringToArray:inputString];

    NSError *error = nil;
    MLMultiArray *multiArray = [[MLMultiArray alloc] initWithShape:@[@(inputArray.count)] dataType:MLMultiArrayDataTypeDouble error:&error];

    if (error) {
        NSLog(@"Error creating MLMultiArray: %@", error.localizedDescription);
        return nil;
    }

    for (NSInteger i = 0; i < inputArray.count; i++) {
        multiArray[i] = inputArray[i];
    }

    return multiArray;
}

- (NSArray<NSNumber *> *)convertStringToArray:(NSString *)inputString {
    NSMutableArray<NSNumber *> *array = [NSMutableArray array];
    for (NSInteger i = 0; i < inputString.length; i++) {
        [array addObject:@([inputString characterAtIndex:i])];
    }
    return array;
}

@end
