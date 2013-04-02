//
//  StacManAccessToken.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManAccessToken : NSObject
@property NSString* accessTokenName;
@property NSNumber* accountId;
@property NSDate* expiresOnDate;
@property NSArray* scope;

+(StacManAccessToken*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
