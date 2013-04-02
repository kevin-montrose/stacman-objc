//
//  StacManError.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManError.h"
#import "PropertySetter.h"

@implementation StacManError
@synthesize description;
@synthesize errorId;
@synthesize errorName;

+(StacManError*)parse:(NSDictionary*)dict
{
    StacManError* ret = [[StacManError alloc] init];
    
    if(ret)
    {
        Parse([StacManError class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManError parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
