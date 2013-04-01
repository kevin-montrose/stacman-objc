//
//  StacManResponse.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManWrapper.h"

@interface StacManResponse : NSObject
@property (readonly) BOOL success;
@property (readonly) StacManWrapper* data;

-(void)fulfil:(StacManWrapper*)data success:(BOOL)success;
@end
