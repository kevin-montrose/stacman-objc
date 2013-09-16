//
//  StacManQuestion.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"
#import "StacManMigrationInfo.h"
#import "StacManDeserializable.h"

@interface StacManQuestion : NSObject <StacManDeserializable>
@property NSNumber* acceptedAnswerId;

@property NSNumber* answerCount;

@property NSArray* answers;

@property NSString* body;

@property NSNumber* bountyAmount;

@property NSDate* bountyClosesDate;

@property NSDate* closedDate;

@property NSString* closedReason;

@property NSArray* comments;

@property NSDate* communityOwnedDate;

@property NSDate* creationDate;

@property NSNumber* downVoteCount;

@property NSNumber* favoriteCount;

@property NSNumber* isAnswered;

@property NSDate* lastActivityDate;

@property NSDate* lastEditDate;

@property NSString* link;

@property NSDate* lockedDate;

@property StacManMigrationInfo* migratedFrom;

@property StacManMigrationInfo* migratedTo;

@property StacManShallowUser* owner;

@property NSDate* protectedDate;

@property NSNumber* questionId;

@property NSNumber* score;

@property NSArray* tags;

@property NSString* title;

@property NSNumber* upVoteCount;

@property NSNumber* viewCount;

+(StacManQuestion*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;

-(void)finishDeserializing;
@end
