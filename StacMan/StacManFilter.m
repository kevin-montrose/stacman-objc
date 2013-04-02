//
//  StacManFilter.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManFilter.h"
#import "PropertySetter.h"

@implementation StacManFilter
@synthesize filter;
@synthesize filterType;
@synthesize includedFields;

+(StacManFilter*)parse:(NSDictionary*)dict
{
    StacManFilter* ret = [[StacManFilter alloc] init];
    
    if(ret)
    {
        Parse([StacManFilter class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManFilter parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
