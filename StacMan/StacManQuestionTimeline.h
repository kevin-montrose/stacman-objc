//
//  StacManQuestionTimeline.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"
#import "StacManDeserializable.h"

@interface StacManQuestionTimeline : NSObject <StacManDeserializable>
@property NSNumber* commentId;

@property NSDate* creationDate;

@property NSNumber* downVoteCount;

@property StacManShallowUser* owner;

@property NSNumber* postId;

@property NSNumber* questionId;

@property NSString* revisionGuid;

@property NSString* timelineType;

@property NSNumber* upVoteCount;

@property StacManShallowUser* user;

+(StacManQuestionTimeline*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
