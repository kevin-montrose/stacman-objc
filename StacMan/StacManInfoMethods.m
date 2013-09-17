//
//  StacManInfoMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManInfoMethods.h"
#import "StacManInfo.h"

@implementation StacManInfoMethods
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

-(StacManResponse*)getOnSite:(NSString*)site filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/info?site=%@&key=%@&filter=%@",
     site,
     key,
     filter ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManInfo class] delegate:del backoffKey:@"info"];
}
@end
