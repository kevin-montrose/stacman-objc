//
//  StacManAnswer.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"
#import "PropertySetter.h"
#import "StacManComment.h"

@interface StacManAnswer : NSObject
@property NSNumber* answerId;

@property NSString* body;

@property NSArray* comments;

@property NSDate* communityOwnedDate;

@property NSDate* creationDate;

@property NSNumber* downVoteCount;

@property NSNumber* isAccepted;

@property NSDate* lastActivityDate;

@property NSDate* lastEditDate;

@property NSString* link;

@property NSDate* lockedDate;

@property StacManShallowUser* owner;

@property NSNumber* questionId;

@property NSNumber* score;

@property NSString* title;

@property NSNumber* upVoteCount;
+(StacManAnswer*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;

-(void)finishDeserializing;
@end
