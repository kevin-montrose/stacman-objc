//
//  StacManInboxItem.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManInboxItem.h"
#import "PropertySetter.h"

@implementation StacManInboxItem
@synthesize site;
@synthesize answerId;
@synthesize body;
@synthesize commentId;
@synthesize creationDate;
@synthesize isUnread;
@synthesize itemType;
@synthesize link;
@synthesize questionId;
@synthesize title;

+(StacManInboxItem*)parse:(NSDictionary*)dict
{
    StacManInboxItem* ret = [[StacManInboxItem alloc] init];
    
    if(ret)
    {
        Parse([StacManInboxItem class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManInboxItem parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
