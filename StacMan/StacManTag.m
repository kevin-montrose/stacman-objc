//
//  StacManTag.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTag.h"
#import "PropertySetter.h"

@implementation StacManTag
@synthesize count;
@synthesize hasSynonyms;
@synthesize isModeratorOnly;
@synthesize isRequired;
@synthesize lastActivityDate;
@synthesize name;
@synthesize userId;

+(StacManTag*)parse:(NSDictionary*)dict
{
    StacManTag* ret = [[StacManTag alloc] init];
    
    if(ret)
    {
        Parse([StacManTag class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManTag parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
