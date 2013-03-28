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
@synthesize Backoff;
@synthesize ErrorId;
@synthesize ErrorMessage;
@synthesize ErrorName;
@synthesize HasMore;
@synthesize Items;
@synthesize Page;
@synthesize PageSize;
@synthesize QuotaMax;
@synthesize QuotaRemaining;
@synthesize Total;
@synthesize Type;
@synthesize Error;

id TryGet(NSDictionary* dict, NSString* key, id defaultValue)
{
    BOOL exists = [[dict allKeys] containsObject:key];
    
    if(!exists) return defaultValue;
    
    return [dict valueForKey:key];
}

-(id)initWithJson:(NSData*)data type:(NSString*)type
{
    Type = type;
    NSError* error;
    
    NSDictionary* parsed = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &error];
    
    NSArray* items = TryGet(parsed, @"items", nil);
    
    Error = error;
    Backoff = [TryGet(parsed, @"backoff", [NSNumber numberWithBool:NO]) boolValue];
    ErrorId = [TryGet(parsed, @"error_id", [NSNumber numberWithInt:0]) intValue];
    ErrorMessage = TryGet(parsed, @"error_message", nil);
    
    if ([type caseInsensitiveCompare:@"question"] == NSOrderedSame) {
        Items = [StacManQuestion parseArray:items];
    }
    
    return self;
}
@end
