//
//  StacManRevisionMethods.h
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

@interface StacManRevisionMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getByIds(String site, UUID[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del;
@end
