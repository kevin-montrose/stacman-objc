//
//  StacManTagSynonym.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTagSynonym.h"
#import "PropertySetter.h"

@implementation StacManTagSynonym
@synthesize appliedCount;
@synthesize creationDate;
@synthesize fromTag;
@synthesize lastAppliedDate;
@synthesize toTag;

+(StacManTagSynonym*)parse:(NSDictionary*)dict
{
    StacManTagSynonym* ret = [[StacManTagSynonym alloc] init];
    
    if(ret)
    {
        Parse([StacManTagSynonym class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManTagSynonym parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
