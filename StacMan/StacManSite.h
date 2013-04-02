//
//  StacManSite.h
//  StacMan
//
//  Created by Kevin Montrose on 3/29/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManStyling.h"

@interface StacManSite : NSObject
@property NSArray* aliases;

@property NSString* apiSiteParameter;

@property NSString* audience;

@property NSDate* closedBetaDate;

@property NSString* faviconUrl;

@property NSString* iconUrl;

@property NSDate* launchDate;

@property NSString* logoUrl;

@property NSArray* markdownExtensions;

@property NSString* name;

@property NSDate* openBetaDate;

@property NSArray* relatedSites;

@property NSString* siteState;

@property NSString* siteType;

@property NSString* siteUrl;

@property StacManStyling* styling;

@property NSString* twitterAccount;

+(StacManSite*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;

-(void)finishDeserializing;
@end
