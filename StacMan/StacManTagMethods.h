//
//  StacManTagMethods.h
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


@interface StacManTagMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getAll(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order, String inname)
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del;

//getByName(String site, String[] tags, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getByNameOnSite:(NSString*)site tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del;

//getModeratorOnly(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order, String inname)
-(StacManResponse*)getModeratorOnlyOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del;

//getRequired(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order, String inname)
-(StacManResponse*)getRequiredOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del;

//getAllSynonyms(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSynonymSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getAllSynonymsOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del;

//getFrequentlyAsked(String site, String[] tags, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getFrequentlyAskedOnSite:(NSString*)site filter:(NSString*)filter tags:(NSArray*)tags page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;

//getRelated(String site, String[] tags, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getRelatedOnSite:(NSString*)site filter:(NSString*)filter tags:(NSArray*)tags page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;

//getSynonymsForTags(String site, String[] tags, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSynonymSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getSynonymsForTagsOnSite:(NSString*)site tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del;

//getTopAnswerers(String site, String tag, TagPeriod period, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getTopAnswerersOnSite:(NSString*)site tag:(NSString*)tag period:(NSString*)period filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;

//getTopAskers(String site, String tag, TagPeriod period, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getTopAskersOnSite:(NSString*)site tag:(NSString*)tag period:(NSString*)period filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;

//getTagWikis(String site, String[] tags, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getTagWikisOnSite:(NSString*)site tags:(NSArray*)tags period:(NSString*)period filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;
@end
