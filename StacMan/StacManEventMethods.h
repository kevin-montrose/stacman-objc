//
//  StacManEventMethods.h
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

@interface StacManEventMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getRecent(String site, String access_token, String filter, Integer page, Integer pagesize, Date since)
-(StacManResponse*)getRecentOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize since:(NSDate*)since delegate:(NSObject<StacManDelegate>*)del;
@end
