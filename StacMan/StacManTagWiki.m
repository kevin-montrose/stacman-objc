//
//  StacManTagWiki.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTagWiki.h"
#import "PropertySetter.h"

@implementation StacManTagWiki
@synthesize body;
@synthesize bodyLastEditDate;
@synthesize excerpt;
@synthesize excerptLastEditDate;
@synthesize lastBodyEditor;
@synthesize lastExcerptEditor;
@synthesize tagName;

+(StacManTagWiki*)parse:(NSDictionary*)dict
{
    StacManTagWiki* ret = [[StacManTagWiki alloc] init];
    
    if(ret)
    {
        Parse([StacManTagWiki class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManTagWiki parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
