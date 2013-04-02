//
//  StacManRevision.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManRevision.h"
#import "PropertySetter.h"

@implementation StacManRevision
@synthesize body;
@synthesize creationDate;
@synthesize comment;
@synthesize isRollback;
@synthesize lastBody;
@synthesize lastTags;
@synthesize lastTitle;
@synthesize postId;
@synthesize postType;
@synthesize revisionGuid;
@synthesize revisionNumber;
@synthesize revisionType;
@synthesize setCommunityWiki;
@synthesize tags;
@synthesize title;
@synthesize user;

+(StacManRevision*)parse:(NSDictionary*)dict
{
    StacManRevision* ret = [[StacManRevision alloc] init];
    
    if(ret)
    {
        Parse([StacManRevision class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManRevision parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
