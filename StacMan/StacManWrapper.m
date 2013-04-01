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
    }
    
    return self;
}
@end
