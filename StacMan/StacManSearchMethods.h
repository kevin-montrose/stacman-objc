//
//  StacManSearchMethods.h
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

@interface StacManSearchMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getMatches(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSearchSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged, String nottagged, String inttitle)
-(StacManResponse*)getMatchesOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged notTagged:(NSString*)notTagged inTitle:(NSString*)inTitle delegate:(NSObject<StacManDelegate>*)del;

//getSimilar(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSearchSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged, String nottagged, String inttitle)
-(StacManResponse*)getSimilarOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged notTagged:(NSString*)notTagged inTitle:(NSString*)inTitle delegate:(NSObject<StacManDelegate>*)del;
@end
