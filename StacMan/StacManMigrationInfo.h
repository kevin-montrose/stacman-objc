//
//  StacManMigrationInfo.h
//  StacMan
//
//  Created by Kevin Montrose on 3/29/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManSite.h"

@interface StacManMigrationInfo : NSObject
@property NSDate* onDate;
@property StacManSite* otherSite;
@property NSNumber* questionId;
@end
