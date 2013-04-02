//
//  StacManEventMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManEventMethods.h"

@implementation StacManEventMethods
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

-(StacManResponse*)getRecentOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize since:(NSDate*)since delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/events?accessToken=%@&key=%@&filter=%@&page=%i&pagesize=%i&since=%@",
     accessToken,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(since) ?: @""
     ];
    
    return [client enqueue:url ofType:@"event" delegate:del];
}
@end
