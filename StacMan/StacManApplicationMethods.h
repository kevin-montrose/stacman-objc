//
//  StacManApplicationMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"
#import "StacManResponse.h"
#import "StacManDelegate.h"

@class StacMancLient;

@interface StacManApplicationMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

//deauthenticate(String[] accessTokens, String filter, Integer page, Integer pagesize)
-(StacManResponse*)deauthenticateWithAccessTokens:(NSArray*)accessTokens filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;
@end
