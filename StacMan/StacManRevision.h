//
//  StacManRevision.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"
#import "StacManDeserializable.h"

@interface StacManRevision : NSObject <StacManDeserializable>
@property NSString* body;

@property NSString* comment;

@property NSDate* creationDate;

@property NSNumber* isRollback;

@property NSString* lastBody;

@property NSArray* lastTags;

@property NSString* lastTitle;

@property NSNumber* postId;

@property NSString* postType;

@property NSString* revisionGuid;

@property NSNumber* revisionNumber;

@property NSString* revisionType;

@property NSNumber* setCommunityWiki;

@property NSArray* tags;

@property NSString* title;

@property StacManShallowUser* user;

+(StacManRevision*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
