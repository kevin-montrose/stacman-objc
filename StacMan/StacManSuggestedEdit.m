//
//  StacManSuggestedEdit.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManSuggestedEdit.h"
#import "PropertySetter.h"

@implementation StacManSuggestedEdit
@synthesize approval_date;
@synthesize body;
@synthesize comment;
@synthesize creation_date;
@synthesize post_id;
@synthesize post_type;
@synthesize proposing_user;
@synthesize rejection_date;
@synthesize suggested_edit_id;
@synthesize tags;
@synthesize title;

+(StacManSuggestedEdit*)parse:(NSDictionary*)dict
{
    StacManSuggestedEdit* ret = [[StacManSuggestedEdit alloc] init];
    
    if(ret)
    {
        Parse([StacManSuggestedEdit class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManSuggestedEdit parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
