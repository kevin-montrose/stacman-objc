//
//  StacManPost.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManPost.h"
#import "PropertySetter.h"
#import "StacManComment.h"

@implementation StacManPost
@synthesize body;
@synthesize comments;
@synthesize creationDate;
@synthesize downVoteCount;
@synthesize lastActivityDate;
@synthesize lastEditDate;
@synthesize owner;
@synthesize postId;
@synthesize postType;
@synthesize score;
@synthesize upVoteCount;

+(StacManPost*)parse:(NSDictionary*)dict
{
    StacManPost* ret = [[StacManPost alloc] init];
    
    if(ret)
    {
        Parse([StacManPost class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManPost parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}

-(void)finishDeserializing
{
    {
        NSMutableArray* cAsMutable = (NSMutableArray*)comments;
        if(cAsMutable)
        {
            Class cClass = [StacManComment class];
            
            for(unsigned int i = 0; i < cAsMutable.count; i++)
            {
                NSDictionary* raw = [cAsMutable objectAtIndex:i];
                id obj = [[cClass alloc] init];
                Parse(cClass, obj, raw);
                
                [cAsMutable setObject:obj atIndexedSubscript:i];
            }
        }
    }
}
@end
