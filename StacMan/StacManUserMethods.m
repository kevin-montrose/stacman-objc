//
//  StacManUserMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManUserMethods.h"

@implementation StacManUserMethods
StacManClient* client;

-(id)initWithClient:(StacManClient *)c
{
    self = [super init];

    if(self)
    {
        client = c;
    }
    
    return self;
}

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&inName=%@",
     site,
     key,
     filter,
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax(3, ConvertDate(minDate), min, minName),
     MinMax(3, ConvertDate(maxDate), max, maxName),
     order ?: @"",
     inName
    ];
    
    return [client enqueue:url ofType:@"user"];
}
@end
