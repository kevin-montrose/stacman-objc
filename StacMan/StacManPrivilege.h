//
//  StacManPrivilege.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManDeserializable.h"

@interface StacManPrivilege : NSObject <StacManDeserializable>
@property NSString* description;
@property NSNumber* reputation;
@property NSString* shortDescription;

+(StacManPrivilege*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
