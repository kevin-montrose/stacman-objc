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
#import "StacManMigrationInfo.h"
#import "Utils.h"

@class StacManClient;
@interface StacManQuestionMethods : NSObject
-(id)initWithClient:(StacManClient*)client;
//String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionAllSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order, String tagged
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged;

@end
