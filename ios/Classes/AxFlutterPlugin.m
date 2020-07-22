#import "AxFlutterPlugin.h"

@implementation AxFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ax_flutter_plugin"
            binaryMessenger:[registrar messenger]];
  AxFlutterPlugin* instance = [[AxFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([@"getPlatformVersion" isEqualToString:call.method]) {

        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);

    } else if([@"key_chain_set" isEqualToString:call.method]){

        NSString *key =call.arguments[@"key"];
        NSString *value =call.arguments[@"value"];
        [NSUserDefaults.standardUserDefaults setObject:value forKey:key];
        BOOL callValue = NSUserDefaults.standardUserDefaults.synchronize;
        result (@(callValue));

    } else if([@"key_chain_get" isEqualToString:call.method]){

        NSString *key =call.arguments[@"key"];
        id callValue = [NSUserDefaults.standardUserDefaults objectForKey:key];
        result (callValue);

    } else if([@"key_chain_remove" isEqualToString:call.method]){

        NSString *key =call.arguments[@"key"];
        [NSUserDefaults.standardUserDefaults removeObjectForKey:key];
        BOOL callValue = NSUserDefaults.standardUserDefaults.synchronize;
        result (@(callValue));

    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
