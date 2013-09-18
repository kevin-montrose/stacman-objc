//
//  StacManFilter.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManDeserializable.h"

@interface StacManFilter : NSObject <StacManDeserializable>
@property NSString* filter;

@property NSString* filterType;

@property NSArray* includedFields;

+(StacManFilter*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
