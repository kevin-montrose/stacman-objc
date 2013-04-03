//
//  StacManAnswer.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManAnswer.h"
#import "PropertySetter.h"

@implementation StacManAnswer
@synthesize answerId;
@synthesize body;
@synthesize comments;
@synthesize communityOwnedDate;
@synthesize creationDate;
@synthesize downVoteCount;
@synthesize isAccepted;
@synthesize lastActivityDate;
@synthesize lastEditDate;
@synthesize link;
@synthesize lockedDate;
@synthesize owner;
@synthesize questionId;
@synthesize score;
@synthesize title;
@synthesize upVoteCount;

+(StacManAnswer*)parse:(NSDictionary*)dict
{
    StacManAnswer* ret = [[StacManAnswer alloc] init];
    
    if(ret)
    {
        Parse([StacManAnswer class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManAnswer parse:[json objectAtIndex:i]]];
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
