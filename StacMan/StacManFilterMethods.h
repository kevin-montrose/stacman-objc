//
//  StacManFilterMethods.h
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

@interface StacManFilterMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

-(StacManResponse*)readFilters:(NSArray*)filters filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del;
-(StacManResponse*)createFilterWithIncludes:(NSArray*)includes excludes:(NSArray*)excludes base:(NSString*)base unsafe:(BOOL)unsafe filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del;
@end
