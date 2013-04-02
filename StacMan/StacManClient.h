//
//  StacMan.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StacManQuestionMethods.h"
#import "StacManResponse.h"
#import "StacManUserMethods.h"
#import "StacManSiteMethods.h"
#import "StacManAccessTokenMethods.h"
#import "StacManDelegate.h"
#import "StacManAnswerMethods.h"

@class StacManQuestionMethods;
@class StacManUserMethods;
@class StacManSiteMethods;
@class StacManAccessTokenMethods;
@class StacManAnswerMethods;

@interface StacManClient : NSObject

@property NSObject<StacManDelegate>* delegate;

@property (readonly) StacManQuestionMethods* questions;
@property (readonly) StacManUserMethods* users;
@property (readonly) StacManSiteMethods* sites;
@property (readonly) StacManAccessTokenMethods* accessTokens;
@property (readonly) StacManAnswerMethods* answers;

@property (readonly) NSString* key;
@property (readonly) NSOperationQueue* queue;

-(id)initWithKey:(NSString*)key;
-(StacManResponse*)enqueue:(NSString*)url ofType:(NSString*)type delegate:(NSObject<StacManDelegate>*)delegate;
@end
