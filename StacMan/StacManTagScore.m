//
//  StacManTagScore.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTagScore.h"
#import "PropertySetter.h"

@implementation StacManTagScore
@synthesize score;
@synthesize postCount;
@synthesize user;

+(StacManTagScore*)parse:(NSDictionary*)dict
{
    StacManTagScore* ret = [[StacManTagScore alloc] init];
    
    if(ret)
    {
        Parse([StacManTagScore class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManTagScore parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
