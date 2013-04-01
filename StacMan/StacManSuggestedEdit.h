//
//  StacManSuggestedEdit.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"

@interface StacManSuggestedEdit : NSObject
@property NSDate* approval_date;

@property NSString* body;

@property NSString* comment;

@property NSDate* creation_date;

@property NSNumber* post_id;

@property NSString* post_type;

@property StacManShallowUser* proposing_user;

@property NSDate* rejection_date;

@property NSNumber* suggested_edit_id;

@property NSArray* tags;

@property NSString* title;

+(StacManSuggestedEdit*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
