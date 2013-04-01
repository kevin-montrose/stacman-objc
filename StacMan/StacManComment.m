//
//  StacManComment.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManComment.h"
#import "PropertySetter.h"

@implementation StacManComment
@synthesize body;
@synthesize commentId;
@synthesize creationDate;
@synthesize edited;
@synthesize link;
@synthesize owner;
@synthesize postId;
@synthesize postType;
@synthesize replyToUser;
@synthesize score;

+(StacManComment*)parse:(NSDictionary*)dict
{
    StacManComment* ret = [[StacManComment alloc] init];
    
    if(ret)
    {
        Parse([StacManComment class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManComment parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
