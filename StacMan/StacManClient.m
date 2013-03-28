//
//  StacMan.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManClient.h"

@implementation StacManClient

@synthesize Questions = _Questions;
@synthesize Key = _Key;

-(id)initWithKey:(NSString*)key;
{
    _Key = key;
    _Questions = [[StacManQuestionMethods alloc] initWithClient:self];
    
    return self;
}

@end
