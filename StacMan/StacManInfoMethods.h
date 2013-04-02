//
//  StacManInfoMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"
#import "StacManResponse.h"
#import "StacManDelegate.h"

@class StacManClient;

@interface StacManInfoMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//get(String site, String filter)
-(StacManResponse*)getOnSite:(NSString*)site filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del;
@end
