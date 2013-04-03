//
//  StacManUserTimeline.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManUserTimeline : NSObject
@property NSNumber* badgeId;

@property NSNumber* commentId;

@property NSDate* creationDate;

@property NSString* detail;

@property NSString* link;

@property NSNumber* postId;

@property NSString* postType;

@property NSNumber* suggestedEditId;

@property NSString* timelineType;

@property NSString* title;

@property NSNumber* userId;

+(StacManUserTimeline*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
