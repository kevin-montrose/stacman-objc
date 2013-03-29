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
@synthesize success;
@synthesize data;
-(id)initWithWrapper:(StacManWrapper*)d
{
    self = [super init];
    
    if(self)
    {
        self.data = d;
    }
    
    return self;
}
@end
