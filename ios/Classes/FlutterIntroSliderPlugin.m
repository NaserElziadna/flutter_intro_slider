#import "FlutterIntroSliderPlugin.h"
#if __has_include(<flutter_intro_slider/flutter_intro_slider-Swift.h>)
#import <flutter_intro_slider/flutter_intro_slider-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_intro_slider-Swift.h"
#endif

@implementation FlutterIntroSliderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterIntroSliderPlugin registerWithRegistrar:registrar];
}
@end
