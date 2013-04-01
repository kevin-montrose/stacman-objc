//
//  StacMan.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManClient.h"

@implementation StacManClient

@synthesize questions = _questions;
@synthesize key = _key;
@synthesize queue = _queue;

-(id)initWithKey:(NSString*)key;
{
    self = [super init];
    
    if(self)
    {
        _key = key;
        _questions = [[StacManQuestionMethods alloc] initWithClient:self];
        _queue = [[NSOperationQueue alloc] init];
        [_queue setMaxConcurrentOperationCount:30];
    }
    
    return self;
}

@end
