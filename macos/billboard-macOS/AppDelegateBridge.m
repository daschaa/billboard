#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
@interface RCT_EXTERN_MODULE(AppDelegate, NSObject)
RCT_EXPORT_VIEW_PROPERTY(quote, NSString)
@end
