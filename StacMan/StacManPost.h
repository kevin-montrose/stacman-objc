//
//  StacManPost.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"

@interface StacManPost : NSObject
@property NSString* body;

@property NSArray* comments;

@property NSDate* creationDate;

@property NSNumber* downVoteCount;

@property NSDate* lastActivityDate;

@property NSDate* lastEditDate;

@property StacManShallowUser* owner;

@property NSNumber* postId;

@property NSString* postType;

@property NSNumber* score;

@property NSNumber* upVoteCount;

+(StacManPost*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;

-(void)finishDeserializing;
@end
