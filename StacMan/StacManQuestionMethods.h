//
//  StacManQuestionMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StacManClient.h"
#import "StacManResponse.h"

@class StacManClient;
@interface StacManQuestionMethods : NSObject
-(id)initWithClient:(StacManClient*)client;
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize;
@end
