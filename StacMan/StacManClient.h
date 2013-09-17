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
#import "StacManApplicationMethods.h"
#import "StacManBadgeMethods.h"
#import "StacManCommentMethods.h"
#import "StacManErrorMethods.h"
#import "StacManEventMethods.h"
#import "StacManFilterMethods.h"
#import "StacManInboxMethods.h"
#import "StacManInfoMethods.h"
#import "StacManPostMethods.h"
#import "StacManPrivilegeMethods.h"
#import "StacManRevisionMethods.h"
#import "StacManSearchMethods.h"
#import "StacManSuggestedEditMethods.h"
#import "StacManTagMethods.h"

@class StacManQuestionMethods;
@class StacManUserMethods;
@class StacManSiteMethods;
@class StacManAccessTokenMethods;
@class StacManAnswerMethods;
@class StacManApplicationMethods;
@class StacManBadgeMethods;
@class StacManCommentMethods;
@class StacManErrorMethods;
@class StacManEventMethods;
@class StacManFilterMethods;
@class StacManInboxMethods;
@class StacManInfoMethods;
@class StacManPostMethods;
@class StacManPrivilegeMethods;
@class StacManRevisionMethods;
@class StacManSearchMethods;
@class StacManSuggestedEditMethods;
@class StacManTagMethods;

typedef enum {
    StacManTierDev,
    StacManTierProd
} StacManTier;

@interface StacManClient : NSObject {
    int currentRequestCount;
    dispatch_semaphore_t globalBlock;
    dispatch_source_t timer;
    
    NSMutableDictionary* backoffs;
}

@property NSObject<StacManDelegate>* delegate;
@property StacManTier tier;

@property (readonly) StacManQuestionMethods* questions;
@property (readonly) StacManUserMethods* users;
@property (readonly) StacManSiteMethods* sites;
@property (readonly) StacManAccessTokenMethods* accessTokens;
@property (readonly) StacManAnswerMethods* answers;
@property (readonly) StacManApplicationMethods* applications;
@property (readonly) StacManBadgeMethods* badges;
@property (readonly) StacManCommentMethods* comments;
@property (readonly) StacManErrorMethods* errors;
@property (readonly) StacManEventMethods* events;
@property (readonly) StacManFilterMethods* filters;
@property (readonly) StacManInboxMethods* inbox;
@property (readonly) StacManInfoMethods* info;
@property (readonly) StacManPostMethods* posts;
@property (readonly) StacManPrivilegeMethods* privileges;
@property (readonly) StacManRevisionMethods* revisions;
@property (readonly) StacManSearchMethods* search;
@property (readonly) StacManSuggestedEditMethods* suggestedEdits;
@property (readonly) StacManTagMethods* tags;

@property (readonly) NSString* key;
@property (readonly) NSOperationQueue* queue;

-(id)initWithKey:(NSString*)key;
-(StacManResponse*)enqueue:(NSString*)url ofType:(Class)type delegate:(NSObject<StacManDelegate>*)delegate backoffKey:(NSString*)key;
@end
