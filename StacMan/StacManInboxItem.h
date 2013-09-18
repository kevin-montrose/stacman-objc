//
//  StacManInboxItem.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManSite.h"
#import "StacManDeserializable.h"

@interface StacManInboxItem : NSObject <StacManDeserializable>
@property NSNumber* answerId;

@property NSString* body;

@property NSNumber* commentId;

@property NSDate* creationDate;

@property NSDate* addedDate;

@property NSNumber* isUnread;

@property NSString* itemType;

@property NSString* link;

@property NSNumber* questionId;

@property StacManSite* site;

@property NSString* title;

+(StacManInboxItem*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
