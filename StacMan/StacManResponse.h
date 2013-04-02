//
//  StacManResponse.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManWrapper.h"
#import "StacManDelegate.h"

@class StacManClient;
@protocol StacManDelegate;

@interface StacManResponse : NSObject
@property (readonly) BOOL success;
@property (readonly) StacManWrapper* data;

-(id)initWithClient:(StacManClient*)client delegate:(NSObject<StacManDelegate>*)delegate;
-(void)fulfil:(StacManWrapper*)data success:(BOOL)success;
@end
