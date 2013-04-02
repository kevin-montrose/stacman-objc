//
//  StacManAccessTokenMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"

@interface StacManAccessTokenMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//invalidate(String[] accessTokens, String filter, Integer page, Integer pageSize)
-(StacManResponse*)invalidAccessTokens:(NSArray*)accessTokens filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//get(String[] accessTokens, String filter, Integer page, Integer pageSize)
-(StacManResponse*)getAccessTokens:(NSArray*)accessTokens filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;
@end
