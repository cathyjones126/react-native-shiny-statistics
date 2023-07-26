#import "RNShinyStatistics.h"
#import <UMCommon/UMCommon.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>

@implementation RNShinyStatistics

static RNShinyStatistics *instance = nil;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)configUmAppKey:(NSString *)appKey umChanel:(NSString *)channel {
    if (appKey != nil) {
        [UMConfigure initWithAppkey:appKey channel: channel];
    }
}

- (void)configSensorUrl:(NSString *)senUrl sensorProp:(NSDictionary *)senProp {
    SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:senUrl launchOptions:nil];
    options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
    [SensorsAnalyticsSDK startWithConfigOptions:options];
    [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:senProp];
}


@end


