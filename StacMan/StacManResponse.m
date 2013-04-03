//
//  StacManResponse.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManResponse.h"

@implementation StacManResponse

-(id)initWithClient:(StacManClient*)c delegate:(NSObject<StacManDelegate>*)del
{
    self = [super init];
    if(self)
    {
        fulfilled = NO;
        client = c;
        delegate = del;
        lock = dispatch_semaphore_create(0);
    }
    
    return self;
}

-(void)fulfil:(StacManWrapper*)d success:(BOOL)s error:(NSError*)error
{
    if(fulfilled) return;
    
    wrapper = d;
    result = s;
    fault = error;
    fulfilled = YES;
    
    dispatch_semaphore_signal(lock);
    
    // copy for race purposes
    NSObject<StacManDelegate>* clientDel = client.delegate;
    StacManResponse* selfCopy = self;
    NSError* faultCopy = fault;
    
    NSOperationQueue* main = [NSOperationQueue mainQueue];
    
    [main addOperationWithBlock:^{
        if(result)
        {
            if(clientDel)
            {
                [clientDel responseDidSucceed:selfCopy];
            }
            
            if(delegate)
            {
                [delegate responseDidSucceed:selfCopy];
            }
        }
        else
        {
            if(clientDel)
            {
                [clientDel response:selfCopy didFailWithError:faultCopy];
            }
            
            if(delegate)
            {
                [delegate response:selfCopy didFailWithError:faultCopy];
            }
        }
    }];
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

-(NSError*)error
{
    if(fulfilled) return fault;
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    
    return fault;
}
@end
