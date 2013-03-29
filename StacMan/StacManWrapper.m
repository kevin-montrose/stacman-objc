//
//  StacManWrapper.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManWrapper.h"
#import "StacManQuestion.h"

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

-(id)initWithJson:(NSData*)data type:(NSString*)type
{
    self = [super init];
    
    if(self)
    {
        self.type = type;
        NSError* error;
        
        NSDictionary* parsed = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &error];
        
        NSArray* items = TryGet(parsed, @"items", nil);
        
        self.error = error;
        self.backoff = [TryGet(parsed, @"backoff", [NSNumber numberWithBool:NO]) boolValue];
        self.errorId = [TryGet(parsed, @"error_id", [NSNumber numberWithInt:0]) intValue];
        self.errorMessage = TryGet(parsed, @"error_message", nil);
        
        if ([type caseInsensitiveCompare:@"question"] == NSOrderedSame) {
            self.items = [StacManQuestion parseArray:items];
        }
    }
    
    return self;
}
@end
