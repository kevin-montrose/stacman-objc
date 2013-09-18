//
//  StacManTagSynonym.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManDeserializable.h"

@interface StacManTagSynonym : NSObject <StacManDeserializable>
@property NSNumber* appliedCount;

@property NSDate* creationDate;

@property NSString* fromTag;

@property NSDate* lastAppliedDate;

@property NSString* toTag;

+(StacManTagSynonym*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
