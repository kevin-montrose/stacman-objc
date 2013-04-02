//
//  StacManTagScore.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"

@interface StacManTagScore : NSObject
@property NSNumber* postCount;

@property NSNumber* score;

@property StacManShallowUser* user;

+(StacManTagScore*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
