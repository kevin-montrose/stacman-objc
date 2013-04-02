//
//  StacManResponse.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManResponse.h"
#import "StacManWrapper.h"

@implementation StacManResponse
BOOL result;
StacManWrapper* wrapper;

BOOL fulfilled;
dispatch_semaphore_t lock;

__weak StacManClient* client;

-(id)initWithClient:(StacManClient*)c
{
    self = [super init];
    if(self)
    {
        fulfilled = NO;
        client = c;
        lock = dispatch_semaphore_create(0);
    }
    
    return self;
}

-(void)fulfil:(StacManWrapper*)d success:(BOOL)s
{
    if(fulfilled) return;
    
    wrapper = d;
    result = s;
    fulfilled = YES;
    
    dispatch_semaphore_signal(lock);
}

-(StacManWrapper*)data
{
    if(fulfilled) return wrapper;
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    
    return wrapper;
}

-(BOOL)success
{
    if(fulfilled) return result;
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    
    return result;
}
@end
