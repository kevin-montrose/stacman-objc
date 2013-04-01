//
//  StacManTopTag.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManTopTag : NSObject
@property NSNumber* answerCount;

@property NSNumber* answerScore;

@property NSNumber* questionCount;

@property NSNumber* questionScore;

@property NSString* tagName;

+(StacManTopTag*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
