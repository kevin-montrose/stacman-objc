//
//  StacManDelegate.h
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManResponse.h"

@protocol StacManDelegate <NSObject>
-(void)responseDidSucceed:(StacManResponse*)response;
-(void)response:(StacManResponse*)response didFailWithError:(NSError*)error;
@end
