//
//  StacManComment.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"
#import "StacManDeserializable.h"

@interface StacManComment : NSObject <StacManDeserializable>
@property NSString* body;

@property NSNumber* commentId;

@property NSDate* creationDate;

@property NSNumber* edited;

@property NSString* link;

@property StacManShallowUser* owner;

@property NSNumber* postId;

@property NSString* postType;

@property StacManShallowUser* replyToUser;

@property NSNumber* score;

+(StacManComment*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
