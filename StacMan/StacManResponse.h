//
//  StacManResponse.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"
#import "StacManWrapper.h"
#import "StacManDelegate.h"

@class StacManClient;
@protocol StacManDelegate;

@interface StacManResponse : NSObject {
    NSError* fault;
    BOOL result;
    StacManWrapper* wrapper;
    
    BOOL fulfilled;
    dispatch_semaphore_t lock;
    
    StacManClient* client;
    NSObject<StacManDelegate>* delegate;
}

@property (readonly) BOOL success;
@property (readonly) StacManWrapper* data;
@property (readonly) NSError* error;

-(id)initWithClient:(StacManClient*)client delegate:(NSObject<StacManDelegate>*)delegate;
-(void)fulfil:(StacManWrapper*)data success:(BOOL)success error:(NSError*)error;
@end
