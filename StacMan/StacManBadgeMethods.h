//
//  StacManBadgeMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"
#import "StacManDelegate.h"

@interface StacManBadgeMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getAll(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeAllSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, BadgeType mintype, BadgeType maxtype, Order order, String inname)
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del;

//getByIds(String site, Iterable<Integer> ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeAllSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, BadgeType mintype, BadgeType maxtype, Order order)
-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del;

//getNamed(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, Order order, String inname)
-(StacManResponse*)getNamedOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del;

//getRecent(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getRecentOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del;

//getRecentByIds(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate) {
-(StacManResponse*)getRecentByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del;

//getTagBased(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, Order order, String inname)
-(StacManResponse*)getTagBasedOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del;
@end
