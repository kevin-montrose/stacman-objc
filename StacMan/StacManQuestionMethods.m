//
//  StacManQuestionMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManQuestionMethods.h"
#import "StacManQuestion.h"
#import "StacManAnswer.h"
#import "StacManComment.h"
#import "StacManQuestionTimeline.h"
#import "Utils.h"

@implementation StacManQuestionMethods

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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&tagged=%@",
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @"",
     tagged ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qall"];
}

-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&tagged=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @"",
     tagged ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qids"];
}

-(StacManResponse*)getAnswersOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManAnswer class] delegate:del backoffKey:@"qas"];
}

-(StacManResponse*)getCommentsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/comments?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManComment class] delegate:del backoffKey:@"qcs"];
}

-(StacManResponse*)getLinkedOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/linked?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qls"];
}

-(StacManResponse*)getRelatedOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/related?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qrs"];
}

-(StacManResponse*)getTimelinesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/related?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @""];
    
    return [client enqueue:url ofType:[StacManQuestionTimeline class] delegate:del backoffKey:@"qts"];
}

-(StacManResponse*)getFeaturedOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/featured?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&tagged=%@",
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @"",
     tagged ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qfs"];
}

-(StacManResponse*)getUnansweredOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/unanswered?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&tagged=%@",
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @"",
     tagged ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qus"];
}

-(StacManResponse*)getWithNoAnswersOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/questions/no-answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&tagged=%@",
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     MinMax2(ConvertDate(minDate), min),
     MinMax2(ConvertDate(maxDate), max),
     order ?: @"",
     tagged ?: @""
     ];
    
    return [client enqueue:url ofType:[StacManQuestion class] delegate:del backoffKey:@"qns"];
}
@end
