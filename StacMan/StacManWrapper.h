//
//  StacManWrapper.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManWrapper : NSObject
@property int backoff;
@property int errorId;
@property NSString* errorMessage;
@property NSString* errorName;
@property BOOL hasMore;
@property NSArray* items;
@property int page;
@property int pageSize;
@property int quotaMax;
@property int quotaRemaining;
@property int total;
@property NSString* type;

@property NSError* error;

-(id)initWithJson:(NSData*)data type:(NSString*)type;
@end