//
//  StacManBadgeMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManBadgeMethods.h"

@implementation StacManBadgeMethods
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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/badges?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(minRank, minName, minType),
     MinMax3(maxRank, maxName, maxType),
     order ?: @"",
     inname ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del];
}

-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/badges/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(minRank, minName, minType),
     MinMax3(maxRank, maxName, maxType),
     order ?: @"",
     inname ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del];
}

-(StacManResponse*)getNamedOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/badges/named?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(minRank, minName, minType),
     MinMax3(maxRank, maxName, maxType),
     order ?: @"",
     inname ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del];
}

//getRecent(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getRecentOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/badges/recipients?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del];
}

//getRecentByIds(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate) {
-(StacManResponse*)getRecentByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/badges/%@/recipients?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del];
}

//getTagBased(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, Order order, String inname)
-(StacManResponse*)getTagBasedOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType order:(NSString*)order inname:(NSString*)inname delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/badges/tags?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(minRank, minName, minType),
     MinMax3(maxRank, maxName, maxType),
     order ?: @"",
     inname ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del];
}
@end
