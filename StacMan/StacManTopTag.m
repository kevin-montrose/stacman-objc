//
//  StacManTopTag.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTopTag.h"
#import "PropertySetter.h"

@implementation StacManTopTag
@synthesize answerCount;
@synthesize answerScore;
@synthesize questionCount;
@synthesize questionScore;
@synthesize tagName;

+(StacManTopTag*)parse:(NSDictionary*)dict
{
    StacManTopTag* ret = [[StacManTopTag alloc] init];
    
    if(ret)
    {
        Parse([StacManTopTag class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManTopTag parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}

@end
