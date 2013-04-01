//
//  StacManBadge.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"

@interface StacManBadge : NSObject
@property NSNumber* awardCount;

@property NSNumber* badgeId;

@property NSString* badgeType;

@property NSString* description;

@property NSString* link;

@property NSString* name;

@property NSString* rank;

@property StacManShallowUser* user;

+(StacManBadge*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
