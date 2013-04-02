//
//  StacManSiteMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManSiteMethods.h"

@implementation StacManSiteMethods
__weak StacManClient* client;

-(id)initWithClient:(StacManClient*)c
{
    self = [super init];
    if(self)
    {
        client = c;
    }
    
    return self;
}

-(StacManResponse*)getAllWithFilter:(NSString*)filter page:(int)page pageSize:(int)pageSize
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/site?key=%@&filter=%@&page=%i&pagesize=%i",
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"site"];
}
@end
