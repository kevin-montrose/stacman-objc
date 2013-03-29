//
//  StacManWrapper.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StacManWrapper : NSObject
@property int Backoff;
@property int ErrorId;
@property NSString* ErrorMessage;
@property NSString* ErrorName;
@property BOOL HasMore;
@property NSArray* Items;
@property int Page;
@property int PageSize;
@property int QuotaMax;
@property int QuotaRemaining;
@property int Total;
@property NSString* Type;

@property NSError* Error;

-(id)initWithJson:(NSData*)data type:(NSString*)type;
@end