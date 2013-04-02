//
//  StacManError.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManError : NSObject
@property NSString* description;

@property NSNumber* errorId;

@property NSString* errorName;
+(StacManError*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
