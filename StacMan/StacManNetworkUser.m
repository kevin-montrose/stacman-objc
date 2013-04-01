//
//  StacManNetworkUser.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManNetworkUser.h"
#import "PropertySetter.h"

@implementation StacManNetworkUser
@synthesize accountId;
@synthesize answerCount;
@synthesize badgeCounts;
@synthesize creationDate;
@synthesize lastAccessDate;
@synthesize questionCount;
@synthesize reputation;
@synthesize siteName;
@synthesize siteUrl;
@synthesize userId;
@synthesize userType;

+(StacManNetworkUser*)parse:(NSDictionary*)dict
{
    StacManNetworkUser* ret = [[StacManNetworkUser alloc] init];
    
    if(ret)
    {
        Parse([StacManNetworkUser class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManNetworkUser parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
