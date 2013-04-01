//
//  StacManNetworkUser.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManBadgeCount.h"

@interface StacManNetworkUser : NSObject
@property NSNumber* accountId;

@property NSNumber* answerCount;

@property StacManBadgeCount* badgeCounts;

@property NSDate* creationDate;

@property NSDate* lastAccessDate;

@property NSNumber* questionCount;

@property NSNumber* reputation;

@property NSString* siteName;

@property NSString* siteUrl;

@property NSNumber* userId;

@property NSString* userType;

+(StacManNetworkUser*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
