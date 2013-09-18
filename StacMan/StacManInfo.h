//
//  StacManInfo.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManSite.h"
#import "StacManDeserializable.h"

@interface StacManInfo : NSObject <StacManDeserializable>
@property NSNumber* answersPerMinute;

@property NSString* apiRevision;

@property NSNumber* badgesPerMinute;

@property (getter=theNewActiveUsers) NSNumber* newActiveUsers;

@property NSNumber* questionsPerMinute;

@property StacManSite* site;

@property NSNumber* totalAccepted;

@property NSNumber* totalAnswers;

@property NSNumber* totalBadges;

@property NSNumber* totalComments;

@property NSNumber* totalQuestions;

@property NSNumber* totalUnanswered;

@property NSNumber* totalUsers;

@property NSNumber* totalVotes;

+(StacManInfo*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
