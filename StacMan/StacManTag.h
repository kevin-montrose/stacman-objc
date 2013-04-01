//
//  StacManTag.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManTag : NSObject
@property NSNumber* count;
@property NSNumber* hasSynonyms;
@property NSNumber* isModeratorOnly;
@property NSNumber* isRequired;
@property NSDate* lastActivityDate;
@property NSString* name;
@property NSNumber* userId;

+(StacManTag*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
