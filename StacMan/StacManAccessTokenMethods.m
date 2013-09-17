//
//  StacManAccessTokenMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManAccessTokenMethods.h"
#import "StacManAccessToken.h"
#import "Utils.h"

@implementation StacManAccessTokenMethods
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

-(StacManResponse*)invalidAccessTokens:(NSArray*)accessTokens filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/access-tokens/%@/invalidate?key=%@&filter=%@&page=%i&pagesize=%i",
     ConvertArray(accessTokens),
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManAccessToken class] delegate:del backoffKey:@"aci"];
}

-(StacManResponse*)getAccessTokens:(NSArray*)accessTokens filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/access-tokens/%@?key=%@&filter=%@&page=%i&pagesize=%i",
     ConvertArray(accessTokens),
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManAccessToken class] delegate:del backoffKey:@"acg"];
}
@end
