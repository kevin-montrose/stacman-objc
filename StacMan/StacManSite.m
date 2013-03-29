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
