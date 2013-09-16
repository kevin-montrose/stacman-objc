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
#import "StacManAnswer.h"
#import "StacManComment.h"
#import "NSString+SEExtensions.h"

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
@synthesize owner;
@synthesize migratedFrom;
@synthesize migratedTo;

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

-(void)finishDeserializing
{
    {
        NSMutableArray* aAsMutable = (NSMutableArray*)answers;
        if(aAsMutable)
        {
            Class aClass = [StacManAnswer class];
            
            for(unsigned int i = 0; i < aAsMutable.count; i++)
            {
                NSDictionary* raw = [aAsMutable objectAtIndex:i];
                id obj = [[aClass alloc] init];
                Parse(aClass, obj, raw);
                
                [aAsMutable setObject:obj atIndexedSubscript:i];
            }
        }
    }
    
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
    
    self.title = [self.title decodeHTMLEntities];
}
@end
