//
//  Reputation.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManReputation : NSObject
@property NSString* link;

@property NSDate* on_date;

@property NSNumber* post_id;

@property NSString* post_type;

@property NSNumber* reputation_change;

@property NSString* title;

@property NSNumber* user_id;

@property NSString* vote_type;

+(StacManReputation*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
