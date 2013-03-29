//
//  StacManQuestionMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManQuestionMethods.h"

@implementation StacManQuestionMethods

StacManClient* Client;

-(id)initWithClient:(StacManClient*)client
{
    self = [super init];
    
    if(self)
    {
        Client = client;
    }
    
    return self;
}

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged
{
    NSString* key = Client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    NSURL* asUrl = [NSURL URLWithString:url];
    NSError* error;
    NSData* json = [NSData dataWithContentsOfURL:asUrl options:0 error:&error];
    
    StacManWrapper* wrapper = [[StacManWrapper alloc] initWithJson:json type:@"question"];
    
    return [[StacManResponse alloc] initWithWrapper:wrapper];
}

-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pagesize:(int)pagesize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate min:(NSNumber*)min max:(NSNumber*)max order:(NSString*)order tagged:(NSString*)tagged
{
    NSString* key = Client.key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions/%@?site=%@&key=%@&filter=%@&page=%i&pagesize=%i&fromDate=%@&toDate=%@&sort=%@&minDate=%@&maxDate=%@&min=%@&max=%@&order=%@&tagged=%@", ConvertArray(ids), site, key, filter, page, pagesize, ConvertDate(fromDate) ?: @"", ConvertDate(toDate) ?: @"", sort ?: @"", ConvertDate(minDate) ?: @"", ConvertDate(maxDate) ?: @"", min ?: @"", max ?: @"", order ?: @"", tagged ?: @""];
    
    NSURL* asUrl = [NSURL URLWithString:url];
    NSError* error;
    NSData* json = [NSData dataWithContentsOfURL:asUrl options:0 error:&error];
    
    StacManWrapper* wrapper = [[StacManWrapper alloc] initWithJson:json type:@"question"];
    
    return [[StacManResponse alloc] initWithWrapper:wrapper];

}
@end
