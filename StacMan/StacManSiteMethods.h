//
//  StacManSiteMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"
#import "StacManResponse.h"
#import "Utils.h"

@interface StacManSiteMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//getAll(String filter, Integer page, Integer pagesize)
-(StacManResponse*)getAllWithFilter:(NSString*)filter page:(int)page pageSize:(int)pageSize;
@end
