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

-(id)initWithKey:(NSString*)key;
{
    self = [super init];
    
    if(self)
    {
        _key = key;
        _questions = [[StacManQuestionMethods alloc] initWithClient:self];
    }
    
    return self;
}

@end
