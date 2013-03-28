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
    Data = data;
    return self;
}
@end
