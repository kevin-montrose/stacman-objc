//
//  StacManSuggestedEditMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManSuggestedEditMethods.h"
#import "Utils.h"

@implementation StacManSuggestedEditMethods
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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/suggested-edits?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     ConvertDate(minDate) ?: @"",
     ConvertDate(maxDate) ?: @"",
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"suggested_edit" delegate:del backoffKey:@"sealls"];
}

-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/suggested-edits/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     ConvertDate(minDate) ?: @"",
     ConvertDate(maxDate) ?: @"",
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"suggested_edit" delegate:del backoffKey:@"seids"];
}
@end
