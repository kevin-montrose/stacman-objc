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

-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pagesize:(int)pagesize
{
    NSString* key = Client.Key;
    
    NSString* url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.1/questions?site=%@&key=%@&filter=%@&page=%i&pagesize=%i", site, key, filter, page, pagesize];
    
    NSURL* asUrl = [NSURL URLWithString:url];
    NSError* error;
    NSData* json = [NSData dataWithContentsOfURL:asUrl options:0 error:&error];
    
    StacManWrapper* wrapper = [[StacManWrapper alloc] initWithJson:json type:@"question"];
    
    return [[StacManResponse alloc] initWithWrapper:wrapper];
}
@end
