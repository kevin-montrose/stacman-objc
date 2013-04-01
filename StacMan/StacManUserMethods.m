//
//  StacManUserMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManUserMethods.h"

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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName
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
    
    return [client enqueue:url ofType:@"user"];
}

-(StacManResponse*)getByIds:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"user"];
}

-(StacManResponse*)getMe:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"user"];
}

-(StacManResponse*)getAnswers:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"answer"];
}

-(StacManResponse*)getMyAnswers:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"answer"];
}

-(StacManResponse*)getComments:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getMyComments:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getCommentsToUser:(NSString*)site ids:(NSArray*)ids toId:(int)toId filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getMyCommentsToUser:(NSString*)site accessToken:(NSString*)accessToken toId:(int)toId filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getFavorites:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getMyFavorites:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getCommentsMentionedIn:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getMyCommentsMentionedIn:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getQuestions:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getMyQuestions:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getFeaturedQuestions:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getMyFeaturedQuestions:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getQuestionsWithNoAnswers:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getMyQuestionsWithNoAnswers:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getQuestionsWithUnaccepted:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getMyQuestionsWithUnaccepted:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getUnansweredQuestions:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getTopAnswers:(NSString*)site id:(int)_id tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"answer"];
}

-(StacManResponse*)getMyTopAnswers:(NSString*)site accessToken:(NSString*)accessToken tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"answer"];
}

-(StacManResponse*)getTopQuestions:(NSString*)site id:(int)_id tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getMyTopQuestions:(NSString*)site accessToken:(NSString*)accessToken tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getModerators:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"user"];
}

-(StacManResponse*)getElectedModerators:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"user"];
}

-(StacManResponse*)getBadges:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"badge"];
}

-(StacManResponse*)getMyBadges:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"badge"];
}

-(StacManResponse*)getPrivileges:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"privilege"];
}

-(StacManResponse*)getMyPrivileges:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"privilege"];
}

-(StacManResponse*)getReputation:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate
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
    
    return [client enqueue:url ofType:@"reputation"];
}

-(StacManResponse*)getMyReputation:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate
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
    
    return [client enqueue:url ofType:@"reputation"];
}

-(StacManResponse*)getSuggestedEdits:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"suggested_edit"];
}

-(StacManResponse*)getMySuggestedEdits:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"suggested_edit"];
}

-(StacManResponse*)getTags:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"tag"];
}

-(StacManResponse*)getMyTags:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order
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
    
    return [client enqueue:url ofType:@"tag"];
}

-(StacManResponse*)getTimelines:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate
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
    
    return [client enqueue:url ofType:@"user_timeline"];
}

-(StacManResponse*)getMyTimelines:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate
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
    
    return [client enqueue:url ofType:@"user_timeline"];
}

-(StacManResponse*)getTopAnswerTags:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"tag_tag"];
}

-(StacManResponse*)getMyTopAnswerTags:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"tag_tag"];
}

-(StacManResponse*)getTopQuestionTags:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"tag_tag"];
}

-(StacManResponse*)getMyTopQuestionTags:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"tag_tag"];
}

-(StacManResponse*)getInbox:(NSString*)site accessToken:(NSString*)accessToken id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"inbox_item"];
}

-(StacManResponse*)getMyInbox:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"inbox_item"];
}

-(StacManResponse*)getInboxUnread:(NSString*)site accessToken:(NSString*)accessToken id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"inbox_item"];
}

-(StacManResponse*)getMyInboxUnread:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"inbox_item"];
}

-(StacManResponse*)getAssociated:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"network_user"];
}

-(StacManResponse*)getMyAssociated:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize
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
    
    return [client enqueue:url ofType:@"network_user"];
}
@end
