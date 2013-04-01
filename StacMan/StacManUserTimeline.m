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
@synthesize badge_id;
@synthesize comment_id;
@synthesize creation_date;
@synthesize detail;
@synthesize link;
@synthesize post_id;
@synthesize post_type;
@synthesize suggested_edit_id;
@synthesize timeline_type;
@synthesize title;
@synthesize user_id;

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
