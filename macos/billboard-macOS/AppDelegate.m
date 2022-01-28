//
//  AppDelegate.m
//  billboard-macOS
//
//  Created by Joshua Wiegmann on 28.01.22.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AppDelegate, NSObject)
RCT_EXTERN_METHOD(changeStatusBarTitle: (NSString)text);
@end
