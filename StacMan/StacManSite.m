//
//  StacManSite.m
//  StacMan
//
//  Created by Kevin Montrose on 3/29/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManSite.h"
#import "PropertySetter.h"
#import "StacManRelatedSite.h"

@implementation StacManSite
@synthesize aliases;
@synthesize apiSiteParameter;
@synthesize audience;
@synthesize closedBetaDate;
@synthesize faviconUrl;
@synthesize iconUrl;
@synthesize launchDate;
@synthesize logoUrl;
@synthesize markdownExtensions;
@synthesize name;
@synthesize openBetaDate;
@synthesize siteState;
@synthesize siteType;
@synthesize siteUrl;
@synthesize styling;
@synthesize twitterAccount;
@synthesize relatedSites;

+(StacManSite*)parse:(NSDictionary*)dict
{
    StacManSite* ret = [[StacManSite alloc] init];
    
    if(ret)
    {
        Parse([StacManSite class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManSite parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}

-(void)finishDeserializing
{
    NSMutableArray* asMutable = (NSMutableArray*)relatedSites;
    
    if(asMutable)
    {
        Class rSClass = [StacManRelatedSite class];
        
        for(unsigned int i = 0; i < asMutable.count; i++)
        {
            NSDictionary* raw = [asMutable objectAtIndex:i];
            id obj = [[rSClass alloc] init];
            Parse(rSClass, obj, raw);
            
            [asMutable setObject:obj atIndexedSubscript:i];
        }
    }
}
@end
