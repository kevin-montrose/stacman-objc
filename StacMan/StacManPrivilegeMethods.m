//
//  StacManPrivilegeMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManPrivilegeMethods.h"
#import "StacManPrivilege.h"

@implementation StacManPrivilegeMethods
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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/privileges?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManPrivilege class] delegate:del backoffKey:@"privs"];
}
@end
