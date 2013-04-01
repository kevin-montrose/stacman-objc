//
//  StacManBadge.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManBadge.h"
#import "PropertySetter.h"

@implementation StacManBadge
@synthesize awardCount;
@synthesize badgeId;
@synthesize badgeType;
@synthesize description;
@synthesize link;
@synthesize name;
@synthesize rank;
@synthesize user;

+(StacManBadge*)parse:(NSDictionary*)dict
{
    StacManBadge* ret = [[StacManBadge alloc] init];
    
    if(ret)
    {
        Parse([StacManBadge class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManBadge parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
