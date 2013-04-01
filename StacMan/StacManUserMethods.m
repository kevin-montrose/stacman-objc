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
@end