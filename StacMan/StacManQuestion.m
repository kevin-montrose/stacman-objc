//
//  StacManQuestion.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManQuestion.h"
#import <objc/runtime.h>

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

NSString* ToKey(const char* str)
{
    NSMutableString* ret = [NSMutableString string];
    
    CFStringRef cfStr = CFStringCreateWithCString(NULL, str, kCFStringEncodingUTF8);
    
    for(int i = 0; i < CFStringGetLength(cfStr); i++)
    {
        UniChar uc = CFStringGetCharacterAtIndex(cfStr, i);
        
        NSString* asStr = [NSString stringWithCharacters:&uc length:1];
        
        if([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember: uc])
        {
            [ret appendString:@"_"];
            [ret appendString:[asStr lowercaseString]];
        }
        else
        {
            [ret appendString:asStr];
        }
    }
    
    return ret;
}

+(StacManQuestion*)parse:(NSDictionary*)dict
{
    StacManQuestion* ret = [StacManQuestion alloc];
    
    Class c = [StacManQuestion class];
    unsigned int count;
    objc_property_t* props = class_copyPropertyList(c, &count);
    
    for(unsigned int i = 0; i < count; i++)
    {
        const char* name = property_getName(props[i]);
        NSString* propName = [NSString stringWithCString:name encoding:kCFStringEncodingUTF8];
        NSString* asKey = ToKey(name);
        
        id inDict = [dict valueForKey:asKey];
        if(inDict == nil) continue;
        
        [ret setValue:inDict forKey:propName];
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
@end
