//
//  StacManUserTimeline.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManUserTimeline.h"
#import "PropertySetter.h"

@implementation StacManUserTimeline
@synthesize badgeId;
@synthesize commentId;
@synthesize creationDate;
@synthesize detail;
@synthesize link;
@synthesize postId;
@synthesize postType;
@synthesize suggestedEditId;
@synthesize timelineType;
@synthesize title;
@synthesize userId;

+(StacManUserTimeline*)parse:(NSDictionary*)dict
{
    StacManUserTimeline* ret = [[StacManUserTimeline alloc] init];
    
    if(ret)
    {
        Parse([StacManUserTimeline class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManUserTimeline parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
