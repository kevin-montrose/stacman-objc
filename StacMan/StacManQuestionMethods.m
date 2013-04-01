//
//  StacManQuestionMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManQuestionMethods.h"

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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getAnswers:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @""];
    
    return [client enqueue:url ofType:@"answer"];
}

-(StacManResponse*)getComments:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/comments?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @""];
    
    return [client enqueue:url ofType:@"comment"];
}

-(StacManResponse*)getLinked:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/linked?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getRelated:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/related?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getTimelines:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@/related?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @""];
    
    return [client enqueue:url ofType:@"question_timeline"];
}

-(StacManResponse*)getFeatured:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged;
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/featured?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getUnanswered:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/unanswered?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}

-(StacManResponse*)getWithNoAnswers:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged
{
    NSString* key = client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/no-answers?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    return [client enqueue:url ofType:@"question"];
}
@end
