//
//  StacManAccessToken.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManAccessToken.h"
#import "PropertySetter.h"

@implementation StacManAccessToken
@synthesize accessTokenName;
@synthesize accountId;
@synthesize expiresOnDate;
@synthesize scope;

+(StacManAccessToken*)parse:(NSDictionary*)dict
{
    StacManAccessToken* ret = [[StacManAccessToken alloc] init];
    
    if(ret)
    {
        Parse([StacManAccessToken class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManAccessToken parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
