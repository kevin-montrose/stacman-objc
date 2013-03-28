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
@synthesize Success;
@synthesize Data;
-(id)initWithWrapper:(StacManWrapper*)data
{
    self = [super init];
    
    if(self)
    {
        Data = data;
    }
    
    return self;
}
@end
