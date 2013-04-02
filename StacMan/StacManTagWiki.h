//
//  StacManTagWiki.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManShallowUser.h"

@interface StacManTagWiki : NSObject
@property NSString* body;

@property NSDate* bodyLastEditDate;

@property NSString* excerpt;

@property NSDate* excerptLastEditDate;

@property StacManShallowUser* lastBodyEditor;

@property StacManShallowUser* lastExcerptEditor;

@property NSString* tagName;

+(StacManTagWiki*)parse:(NSDictionary*)dict;
+(NSArray*)parseArray:(NSArray*)json;
@end
