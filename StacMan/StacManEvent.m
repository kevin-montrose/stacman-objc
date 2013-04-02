//
//  StacManEvent.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManEvent.h"
#import "PropertySetter.h"

@implementation StacManEvent
@synthesize creationDate;
@synthesize eventId;
@synthesize eventType;
@synthesize excerpt;
@synthesize link;

+(StacManEvent*)parse:(NSDictionary*)dict
{
    StacManEvent* ret = [[StacManEvent alloc] init];
    
    if(ret)
    {
        Parse([StacManEvent class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManEvent parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
