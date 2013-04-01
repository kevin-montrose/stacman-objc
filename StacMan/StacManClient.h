//
//  StacMan.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StacManQuestionMethods.h"

@class StacManQuestionMethods;
@interface StacManClient : NSObject

@property (readonly) StacManQuestionMethods* questions;
@property (readonly) NSString* key;
@property (readonly) NSOperationQueue* queue;

-initWithKey:(NSString*)key;
@end
