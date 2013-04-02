//
//  StacManSuggestedEditMethods.h
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

@interface StacManSuggestedEditMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getAll(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, SuggestedEditSort sort, Date mindate, Date maxdate, Order order)
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del;

//getByIds(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, SuggestedEditSort sort, Date mindate, Date maxdate, Order order)
-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del;
@end
