//
//  StacManTagMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTagMethods.h"
#import "StacManTag.h"
#import "StacManTagScore.h"
#import "StacManTagSynonym.h"
#import "StacManTagWiki.h"
#import "StacManQuestion.h"
#import "Utils.h"

@implementation StacManTagMethods
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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(min, minDate, minName),
     MinMax3(max, maxDate, maxName),
     order ?: @"",
     inName ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManTag class] delegate:del backoffKey:@"talls"];
}

-(StacManResponse*)getByNameOnSite:(NSString*)site tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(min, minDate, minName),
     MinMax3(max, maxDate, maxName),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManTag class] delegate:del backoffKey:@"tnames"];
}

-(StacManResponse*)getModeratorOnlyOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/moderator-only?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(min, minDate, minName),
     MinMax3(max, maxDate, maxName),
     order ?: @"",
     inName ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManTag class] delegate:del backoffKey:@"tmods"];
}

-(StacManResponse*)getRequiredOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/required?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@&inname=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax3(min, minDate, minName),
     MinMax3(max, maxDate, maxName),
     order ?: @"",
     inName ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManTag class] delegate:del backoffKey:@"trequired"];
}

-(StacManResponse*)getAllSynonymsOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/synonyms?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(min, minDate),
     MinMax2(max, maxDate),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManTagSynonym class] delegate:del backoffKey:@"tsyns"];
}

-(StacManResponse*)getFrequentlyAskedOnSite:(NSString*)site filter:(NSString*)filter tags:(NSArray*)tags page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@/faq?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"tfaqs"];
}

-(StacManResponse*)getRelatedOnSite:(NSString*)site filter:(NSString*)filter tags:(NSArray*)tags page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@/related?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"trel"];
}

-(StacManResponse*)getSynonymsForTagsOnSite:(NSString*)site tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@/synonyms?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromdate=%@&todate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(min, minDate),
     MinMax2(max, maxDate),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManTagSynonym class] delegate:del backoffKey:@"tsynft"];
}

-(StacManResponse*)getTopAnswerersOnSite:(NSString*)site tag:(NSString*)tag period:(NSString*)period filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@/top-answerers/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     tag ?: @"",
     period,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManTagScore class] delegate:del backoffKey:@"ttas"];
}

-(StacManResponse*)getTopAskersOnSite:(NSString*)site tag:(NSString*)tag period:(NSString*)period filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@/top-askers/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     tag ?: @"",
     period,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManTagScore class] delegate:del backoffKey:@"ttaos"];
}

-(StacManResponse*)getTagWikisOnSite:(NSString*)site tags:(NSArray*)tags period:(NSString*)period filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/tags/%@/wikis?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:[StacManTagWiki class] delegate:del backoffKey:@"twikis"];
}
@end
