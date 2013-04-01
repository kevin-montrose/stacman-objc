//
//  StacManQuestionTimeline.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManQuestionTimeline.h"
#import "PropertySetter.h"

@implementation StacManQuestionTimeline
@synthesize commentId;
@synthesize creationDate;
@synthesize downVoteCount;
@synthesize owner;
@synthesize postId;
@synthesize questionId;
@synthesize revisionGuid;
@synthesize timelineType;
@synthesize upVoteCount;
@synthesize user;

+(StacManQuestionTimeline*)parse:(NSDictionary*)dict
{
    StacManQuestionTimeline* ret = [[StacManQuestionTimeline alloc] init];
    
    if(ret)
    {
        Parse([StacManQuestionTimeline class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManQuestionTimeline parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
