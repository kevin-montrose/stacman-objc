//
//  StacManWrapper.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManWrapper.h"
#import "StacManQuestion.h"
#import "StacManAnswer.h"
#import "StacManComment.h"
#import "StacManQuestionTimeline.h"
#import "StacManUser.h"
#import "StacManBadge.h"
#import "StacManPrivilege.h"
#import "StacManReputation.h"
#import "StacManSuggestedEdit.h"
#import "StacManTag.h"
#import "StacManUserTimeline.h"
#import "StacManTopTag.h"
#import "StacManInboxItem.h"
#import "StacManNetworkUser.h"
#import "StacManAccessToken.h"
#import "StacManError.h"
#import "StacManEvent.h"
#import "StacManFilter.h"
#import "StacManInfo.h"

@implementation StacManWrapper
@synthesize backoff;
@synthesize errorId;
@synthesize errorMessage;
@synthesize errorName;
@synthesize hasMore;
@synthesize items;
@synthesize page;
@synthesize pageSize;
@synthesize quotaMax;
@synthesize quotaRemaining;
@synthesize total;
@synthesize type;
@synthesize error;

id TryGet(NSDictionary* dict, NSString* key, id defaultValue)
{
    BOOL exists = [[dict allKeys] containsObject:key];
    
    if(!exists) return defaultValue;
    
    return [dict valueForKey:key];
}

-(id)initWithJson:(NSData*)data type:(NSString*)t
{
    self = [super init];
    
    if(self)
    {
        self.type = t;
        NSError* e;
        
        NSDictionary* parsed = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &e];
        
        NSArray* i = TryGet(parsed, @"items", nil);
        
        self.error = e;
        self.backoff = [TryGet(parsed, @"backoff", [NSNumber numberWithBool:NO]) boolValue];
        self.errorId = [TryGet(parsed, @"error_id", [NSNumber numberWithInt:0]) intValue];
        self.errorMessage = TryGet(parsed, @"error_message", nil);
        
        if ([type caseInsensitiveCompare:@"question"] == NSOrderedSame) {
            self.items = [StacManQuestion parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"answer"] == NSOrderedSame) {
            self.items = [StacManAnswer parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"comment"] == NSOrderedSame) {
            self.items = [StacManComment parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"question_timeline"] == NSOrderedSame) {
            self.items = [StacManQuestionTimeline parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"user"] == NSOrderedSame) {
            self.items = [StacManUser parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"badge"] == NSOrderedSame) {
            self.items = [StacManBadge parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"privilege"] == NSOrderedSame) {
            self.items = [StacManPrivilege parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"reputation"] == NSOrderedSame) {
            self.items = [StacManReputation parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"suggested_edit"] == NSOrderedSame) {
            self.items = [StacManSuggestedEdit parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"tag"] == NSOrderedSame) {
            self.items = [StacManTag parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"user_timeline"] == NSOrderedSame) {
            self.items = [StacManUserTimeline parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"tag_tag"] == NSOrderedSame) {
            self.items = [StacManTopTag parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"inbox_item"] == NSOrderedSame) {
            self.items = [StacManInboxItem parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"network_user"] == NSOrderedSame) {
            self.items = [StacManNetworkUser parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"site"] == NSOrderedSame) {
            self.items = [StacManSite parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"access_token"] == NSOrderedSame) {
            self.items = [StacManAccessToken parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            self.items = [StacManError parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"event"] == NSOrderedSame) {
            self.items = [StacManEvent parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"filter"] == NSOrderedSame) {
            self.items = [StacManFilter parseArray:i];
        }
        
        if ([type caseInsensitiveCompare:@"info"] == NSOrderedSame) {
            self.items = [StacManInfo parseArray:i];
        }
    }
    
    return self;
}
@end
