#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(AppDelegate, NSObject)
RCT_EXTERN_METHOD(changeQuote:(NSString*)quote)
@end
