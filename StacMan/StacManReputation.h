//
//  Reputation.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManDeserializable.h"

@interface StacManReputation : NSObject <StacManDeserializable>
@property NSString* link;

@property NSDate* onDate;

@property NSNumber* postId;

@property NSString* postType;

@property NSNumber* reputationChange;

@property NSString* title;

@property NSNumber* userId;

@property NSString* voteType;

+(StacManReputation*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
