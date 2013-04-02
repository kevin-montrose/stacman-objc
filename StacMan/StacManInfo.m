//
//  StacManInfo.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManInfo.h"
#import "PropertySetter.h"

@implementation StacManInfo
@synthesize  answersPerMinute;
@synthesize apiRevision;
@synthesize badgesPerMinute;
@synthesize newActiveUsers;
@synthesize questionsPerMinute;
@synthesize site;
@synthesize totalAccepted;
@synthesize totalAnswers;
@synthesize totalBadges;
@synthesize totalComments;
@synthesize totalQuestions;
@synthesize totalUnanswered;
@synthesize totalUsers;
@synthesize totalVotes;

+(StacManInfo*)parse:(NSDictionary*)dict
{
    StacManInfo* ret = [[StacManInfo alloc] init];
    
    if(ret)
    {
        Parse([StacManInfo class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManInfo parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
