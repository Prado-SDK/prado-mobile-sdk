//
//  PradoOMIDService.h
//  PradoSDK
//
//  Created by Maria Yelfimova on 03/06/2024.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@class PradoOMIDSessionManager;
@class OMIDAdSession;
@class OMIDSDK;

@interface PradoOMIDService : NSObject

@property (class, nonatomic, readonly) NSString * _Nonnull partnerName;

+ (void)activateOMID;
+ (PradoOMIDSessionManager *_Nonnull)createSession:(WKWebView * _Nonnull)webview;

@end
