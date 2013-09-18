//
//  StacManEvent.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManDeserializable.h"

@interface StacManEvent : NSObject <StacManDeserializable>
@property NSDate* creationDate;

@property NSNumber* eventId;

@property NSString* eventType;

@property NSString* excerpt;

@property NSString* link;

+(StacManEvent*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
