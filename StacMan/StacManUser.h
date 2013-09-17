//
//  StacManUser.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManBadgeCount.h"
#import "StacManDeserializable.h"

@interface StacManUser : NSObject <StacManDeserializable>
@property NSString* aboutMe;

@property NSNumber* acceptRate;

@property NSNumber* accountId;

@property NSNumber* age;

@property NSNumber* answerCount;

@property StacManBadgeCount* badgeCounts;

@property NSDate* creationDate;

@property NSString* displayName;

@property NSNumber* downVoteCount;

@property NSNumber* isEmployee;

@property NSDate* lastAccessDate;

@property NSDate* lastModifiedDate;

@property NSString* link;

@property NSString* location;

@property NSString* profileImage;

@property NSNumber* questionCount;

@property NSNumber* reputation;

@property NSNumber* reputationChangeDay;

@property NSNumber* reputationChangeWeek;

@property NSNumber* reputationChangeYear;

@property NSDate* timedPenaltyDate;

@property NSNumber* upVoteCount;

@property NSNumber* userId;

@property NSString* userType;

@property NSNumber* viewCount;

@property NSString* websiteUrl;

+(StacManUser*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
