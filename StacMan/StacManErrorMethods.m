//
//  StacManErrorMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManErrorMethods.h"

@implementation StacManErrorMethods
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

-(StacManResponse*)getAllWithFilter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/errors?key=%@&filter=%@&page=%i&pagesize=%i",
     key,
     filter ?: @"",
     page,
     pageSize
    ];
    
    return [client enqueue:url ofType:@"error" delegate:del backoffKey:@"ealls"];
}

-(StacManResponse*)simulateWithId:(int)_id filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/errors/%i?key=%@&filter=%@",
     _id,
     key,
     filter ?: @""
     ];
    
    return [client enqueue:url ofType:@"error" delegate:del backoffKey:@"esimulate"];
}
@end
