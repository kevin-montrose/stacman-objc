//
//  StacManUserMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManUserMethods.h"
#import "Utils.h"

@implementation StacManUserMethods
__weak StacManClient* client;

-(id)initWithClient:(StacManClient *)c
{
    self = [super init];

    if(self)
    {
        client = c;
    }
    
    return self;
}

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@&inName=%@",
     site,
     key,
     filter ?: @"",
     page,
     pagesize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @"",
     inName ?: @""
    ];
    
    return [client enqueue:url ofType:@"user" delegate:del backoffKey:@"us"];
}

-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"user"  delegate:del backoffKey:@"uids"];
}

-(StacManResponse*)getMeOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"user" delegate:del backoffKey:@"me"];
}

-(StacManResponse*)getAnswersOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"answer" delegate:del backoffKey:@"uas"];
}

-(StacManResponse*)getMyAnswersOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/answers?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"answer" delegate:del backoffKey:@"mas"];
}

-(StacManResponse*)getCommentsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/comments?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"comment" delegate:del backoffKey:@"ucs"];
}

-(StacManResponse*)getMyCommentsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/comments?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"comment" delegate:del backoffKey:@"mcs"];
}

-(StacManResponse*)getCommentsToUserOnSite:(NSString*)site ids:(NSArray*)ids toId:(int)toId filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/comments/%i?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     toId,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"comment" delegate:del backoffKey:@"ucts"];
}

-(StacManResponse*)getMyCommentsToUserOnSite:(NSString*)site accessToken:(NSString*)accessToken toId:(int)toId filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/comments/%i?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     toId,
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"comment" delegate:del backoffKey:@"mcts"];
}

-(StacManResponse*)getFavoritesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/favorites?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"ufs"];
}

-(StacManResponse*)getMyFavoritesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/favorites?accessToken=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"mfs"];
}

-(StacManResponse*)getCommentsMentionedInOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/mentioned?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"comment" delegate:del backoffKey:@"ucms"];
}

-(StacManResponse*)getMyCommentsMentionedInOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/mentioned?accessToken=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"comment" delegate:del backoffKey:@"mcms"];
}

-(StacManResponse*)getQuestionsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/questions?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"uqs"];
}

-(StacManResponse*)getMyQuestionsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/questions?accessToken=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"mqs"];
}

-(StacManResponse*)getFeaturedQuestionsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/questions/featured?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"ufqs"];
}

-(StacManResponse*)getMyFeaturedQuestionsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/questions/featured?accessToken=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"mfqs"];
}

-(StacManResponse*)getQuestionsWithNoAnswersOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/questions/no-answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"uqnas"];
}

-(StacManResponse*)getMyQuestionsWithNoAnswersOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/questions/no-answers?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"mqnas"];
}

-(StacManResponse*)getQuestionsWithUnacceptedOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/questions/unaccepted?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"uqus"];
}

-(StacManResponse*)getMyQuestionsWithUnacceptedOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/questions/unaccepted?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"mqus"];
}

-(StacManResponse*)getUnansweredQuestionsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/questions/unanswered?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"uuqs"];
}

-(StacManResponse*)getTopAnswersOnSite:(NSString*)site id:(int)_id tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/tags/%@/top-answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     _id,
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"answer" delegate:del backoffKey:@"utas"];
}

-(StacManResponse*)getMyTopAnswersOnSite:(NSString*)site accessToken:(NSString*)accessToken tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/tags/%@/top-answers?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(tags),
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"answer" delegate:del backoffKey:@"mtas"];
}

-(StacManResponse*)getTopQuestionsOnSite:(NSString*)site id:(int)_id tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/tags/%@/top-questions?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     _id,
     ConvertArray(tags),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"utqs"];
}

-(StacManResponse*)getMyTopQuestionsOnSite:(NSString*)site accessToken:(NSString*)accessToken tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/tags/%@/top-questions?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(tags),
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"question" delegate:del backoffKey:@"mtqs"];
}

-(StacManResponse*)getModeratorsOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/moderators?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"user" delegate:del backoffKey:@"umods"];
}

-(StacManResponse*)getElectedModeratorsOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/moderators/elected?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"user" delegate:del backoffKey:@"uemods"];
}

-(StacManResponse*)getBadgesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax4(ConvertDate(maxDate), maxRank, maxType, maxName);
    NSString* nx = MinMax4(ConvertDate(minDate), minRank, minType, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/badges?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del backoffKey:@"ubs"];
}

-(StacManResponse*)getMyBadgesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax4(ConvertDate(maxDate), maxRank, maxType, maxName);
    NSString* nx = MinMax4(ConvertDate(minDate), minRank, minType, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/badges?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"badge" delegate:del backoffKey:@"mbs"];
}

-(StacManResponse*)getPrivilegesOnSite:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/privileges?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     _id,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"privilege" delegate:del backoffKey:@"ups"];
}

-(StacManResponse*)getMyPrivilegesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/privileges?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"privilege" delegate:del backoffKey:@"mps"];
}

-(StacManResponse*)getReputationOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/reputation?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @""
     ];
    
    return [client enqueue:url ofType:@"reputation" delegate:del backoffKey:@"urs"];
}

-(StacManResponse*)getMyReputationOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/reputation?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @""
     ];
    
    return [client enqueue:url ofType:@"reputation" delegate:del backoffKey:@"mrs"];
}

-(StacManResponse*)getSuggestedEditsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/suggested-edits?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"suggested_edit" delegate:del backoffKey:@"uses"];
}

-(StacManResponse*)getMySuggestedEditsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax2(ConvertDate(maxDate), max);
    NSString* nx = MinMax2(ConvertDate(minDate), min);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/my/suggested-edits?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"suggested_edit" delegate:del backoffKey:@"mses"];
}

-(StacManResponse*)getTagsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/tags?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"tag" delegate:del backoffKey:@"uts"];
}

-(StacManResponse*)getMyTagsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* mx = MinMax3(ConvertDate(maxDate), max, maxName);
    NSString* nx = MinMax3(ConvertDate(minDate), min, minName);
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/tags?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&min=%@&max=%@&order=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @"",
     sort ?: @"",
     nx,
     mx,
     order ?: @""
     ];
    
    return [client enqueue:url ofType:@"tag" delegate:del backoffKey:@"mts"];
}

-(StacManResponse*)getTimelinesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/timeline?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@",
     ConvertArray(ids),
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @""
     ];
    
    return [client enqueue:url ofType:@"user_timeline" delegate:del backoffKey:@"utls"];
}

-(StacManResponse*)getMyTimelinesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/timeline?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize,
     ConvertDate(fromDate) ?: @"",
     ConvertDate(toDate) ?: @""
     ];
    
    return [client enqueue:url ofType:@"user_timeline" delegate:del backoffKey:@"mtls"];
}

-(StacManResponse*)getTopAnswerTagsOnSite:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/top-answer-tags?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     _id,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"tag_tag" delegate:del backoffKey:@"utats"];
}

-(StacManResponse*)getMyTopAnswerTagsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/top-answer-tags?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"tag_tag" delegate:del backoffKey:@"mtats"];
}

-(StacManResponse*)getTopQuestionTagsOnSite:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/top-question-tags?site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     _id,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"tag_tag" delegate:del backoffKey:@"utqts"];
}

-(StacManResponse*)getMyTopQuestionTagsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/top-question-tags?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"tag_tag" delegate:del backoffKey:@"mtqts"];
}

-(StacManResponse*)getInboxOnSite:(NSString*)site accessToken:(NSString*)accessToken id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/inbox?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     _id,
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"inbox_item" delegate:del backoffKey:@"uis"];
}

-(StacManResponse*)getMyInboxOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/inbox?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"inbox_item" delegate:del backoffKey:@"mis"];
}

-(StacManResponse*)getInboxUnreadOnSite:(NSString*)site accessToken:(NSString*)accessToken id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%i/inbox/unread?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     _id,
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"inbox_item" delegate:del backoffKey:@"uius"];
}

-(StacManResponse*)getMyInboxUnreadOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/inbox/unread?access_token=%@&site=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     site,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"inbox_item" delegate:del backoffKey:@"mius"];
}

-(StacManResponse*)getAssociatedWithAccountIds:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/users/%@/associated?key=%@&filter=%@&page=%i&pagesize=%i",
     ConvertArray(ids),
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"network_user" delegate:del backoffKey:@"uaas"];
}

-(StacManResponse*)getMyAssociatedWithAccessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/me/associated?access_token=%@&key=%@&filter=%@&page=%i&pagesize=%i",
     accessToken,
     key,
     filter ?: @"",
     page,
     pageSize
     ];
    
    return [client enqueue:url ofType:@"network_user" delegate:del backoffKey:@"maas"];
}
@end
