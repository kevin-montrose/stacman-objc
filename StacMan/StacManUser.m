//
//  StacManUser.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManUser.h"
#import "PropertySetter.h"

@implementation StacManUser
@synthesize aboutMe;
@synthesize acceptRate;
@synthesize accountId;
@synthesize age;
@synthesize answerCount;
@synthesize badgeCounts;
@synthesize creationDate;
@synthesize displayName;
@synthesize downVoteCount;
@synthesize isEmployee;
@synthesize lastAccessDate;
@synthesize lastModifiedDate;
@synthesize link;
@synthesize location;
@synthesize profileImage;
@synthesize questionCount;
@synthesize reputation;
@synthesize reputationChangeDay;
@synthesize reputationChangeWeek;
@synthesize reputationChangeYear;
@synthesize timedPenaltyDate;
@synthesize upVoteCount;
@synthesize userId;
@synthesize userType;
@synthesize viewCount;
@synthesize websiteUrl;

+(StacManUser*)parse:(NSDictionary*)dict
{
    StacManUser* ret = [[StacManUser alloc] init];
    
    if(ret)
    {
        Parse([StacManUser class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManUser parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
