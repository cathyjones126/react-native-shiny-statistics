#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNShinyStatistics : NSObject

+ (instancetype)shared;
- (void)configUmAppKey:(NSString *)appKey umChanel:(NSString *)channel;
- (void)configSensorUrl:(NSString *)senUrl sensorProp:(NSDictionary *)senProp;

@end

NS_ASSUME_NONNULL_END
