//
//  StacManUserTimeline.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManUserTimeline : NSObject
@property NSNumber* badge_id;

@property NSNumber* comment_id;

@property NSDate* creation_date;

@property NSString* detail;

@property NSString* link;

@property NSNumber* post_id;

@property NSString* post_type;

@property NSNumber* suggested_edit_id;

@property NSString* timeline_type;

@property NSString* title;

@property NSNumber* user_id;

+(StacManUserTimeline*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
