//
//  Reputation.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManReputation.h"
#import "PropertySetter.h"

@implementation StacManReputation
@synthesize link;
@synthesize onDate;
@synthesize postId;
@synthesize postType;
@synthesize reputationChange;
@synthesize title;
@synthesize userId;
@synthesize voteType;

+(StacManReputation*)parse:(NSDictionary*)dict
{
    StacManReputation* ret = [[StacManReputation alloc] init];
    
    if(ret)
    {
        Parse([StacManReputation class], ret, dict);
    }
    
    return ret;
}

- (NSString*)description
{
    return [[self dictionaryWithValuesForKeys:@[@"title", @"postId", @"reputationChange", @"voteType"]] description];
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManReputation parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
