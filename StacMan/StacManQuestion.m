//
//  StacManQuestion.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManQuestion.h"
#import <objc/runtime.h>
#import "PropertySetter.h"

@implementation StacManQuestion

@synthesize acceptedAnswerId;
@synthesize answerCount;
@synthesize answers;
@synthesize body;
@synthesize bountyAmount;
@synthesize bountyClosesDate;
@synthesize closedDate;
@synthesize closedReason;
@synthesize comments;
@synthesize communityOwnedDate;
@synthesize creationDate;
@synthesize downVoteCount;
@synthesize favoriteCount;
@synthesize isAnswered;
@synthesize lastActivityDate;
@synthesize link;
@synthesize lockedDate;
@synthesize lastEditDate;
@synthesize protectedDate;
@synthesize questionId;
@synthesize score;
@synthesize tags;
@synthesize title;
@synthesize viewCount;
@synthesize upVoteCount;

-(id)init
{
    self = [super init];
    
    return self;
}

+(StacManQuestion*)parse:(NSDictionary*)dict
{
    StacManQuestion* ret = [[StacManQuestion alloc] init];
    
    if(ret)
    {
        Parse([StacManQuestion class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManQuestion parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
