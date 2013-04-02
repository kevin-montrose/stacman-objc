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
#import "Utils.h"
#import "StacManDelegate.h"

@class StacManClient;
@class StacManResponse;

@interface StacManQuestionMethods : NSObject
-(id)initWithClient:(StacManClient*)client;
//String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionAllSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)delegate;
//getByIds(String site, Iterable<Integer> ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)delegate;
//getAnswers(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, AnswerSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getAnswersOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)delegate;
//getComments(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getCommentsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)delegate;
//getLinked(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionRelatedSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getLinkedOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)delegate;
//getRelated(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionRelatedSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getRelatedOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)delegate;
//getTimelines(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getTimelinesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)delegate;
//getFeatured(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged)
-(StacManResponse*)getFeaturedOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)delegate;
//getUnanswered(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged)
-(StacManResponse*)getUnansweredOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)delegate;
//getWithNoAnswers(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged)
-(StacManResponse*)getWithNoAnswersOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)delegate;
@end