//
//  StacManInboxMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManInboxMethods.h"

@implementation StacManInboxMethods
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

-(StacManResponse*)getWithAccessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del;
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/inbox?access_token=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"inbox_item" delegate:del];
}

-(StacManResponse*)getUnreadWithAccessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize since:(NSDate*)since delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/inbox/unread?access_token=%@&key=%@&filter=%@&page=%i&pagesize=%i&since=%@",
     accessToken,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(since) ?: @""
     ];
    
    return [client enqueue:url ofType:@"inbox_item" delegate:del];
}
@end
