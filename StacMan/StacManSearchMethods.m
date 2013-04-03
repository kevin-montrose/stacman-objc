//
//  StacManSearchMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManSearchMethods.h"
#import "Utils.h"

@implementation StacManSearchMethods
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

-(StacManResponse*)getMatchesOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged notTagged:(NSString*)notTagged inTitle:(NSString*)inTitle delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/search?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@tagged=%@&nottagged=%@&intitle=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(minDate, min),
     MinMax2(maxDate, max),
     order ?: @"",
     tagged ?: @"",
     notTagged ?: @"",
     inTitle ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del];
}

-(StacManResponse*)getSimilarOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged notTagged:(NSString*)notTagged inTitle:(NSString*)inTitle delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/similar?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@tagged=%@&nottagged=%@&intitle=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(minDate, min),
     MinMax2(maxDate, max),
     order ?: @"",
     tagged ?: @"",
     notTagged ?: @"",
     inTitle ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del];
}
@end
