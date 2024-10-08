//
//  PradoOMIDSessionManager.h
//  PradoSDK
//
//  Created by Maria Yelfimova on 03/06/2024.
//

#import <Foundation/Foundation.h>

@class OMIDAdSession;
@class OMIDPradocoAdSession;

@interface PradoOMIDSessionManager : NSObject
- (instancetype)initWithOMIDPradocoAdSession:(OMIDPradocoAdSession *)omidPradocoAdSession;
- (void)finish;
- (void)start;

@end
