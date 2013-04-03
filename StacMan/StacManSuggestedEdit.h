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
@property NSDate* approvalDate;

@property NSString* body;

@property NSString* comment;

@property NSDate* creationDate;

@property NSNumber* postId;

@property NSString* postType;

@property StacManShallowUser* proposingUser;

@property NSDate* rejectionDate;

@property NSNumber* suggestedEditId;

@property NSArray* tags;

@property NSString* title;

+(StacManSuggestedEdit*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
