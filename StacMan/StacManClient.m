//
//  StacMan.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManClient.h"

@implementation StacManClient

@synthesize delegate;

@synthesize questions = _questions;
@synthesize users = _users;
@synthesize sites = _sites;
@synthesize accessTokens = _accessTokens;
@synthesize answers = _answers;
@synthesize applications = _applications;

@synthesize key = _key;
@synthesize queue = _queue;

-(id)initWithKey:(NSString*)key;
{
    self = [super init];
    
    if(self)
    {
        _key = key;
        
        _questions = [[StacManQuestionMethods alloc] initWithClient:self];
        _users = [[StacManUserMethods alloc] initWithClient:self];
        _sites = [[StacManSiteMethods alloc] initWithClient:self];
        _accessTokens = [[StacManAccessTokenMethods alloc] initWithClient:self];
        _answers = [[StacManAnswerMethods alloc] initWithClient:self];
        _applications = [[StacManApplicationMethods alloc] initWithClient:self];
        
        _queue = [[NSOperationQueue alloc] init];
        [_queue setMaxConcurrentOperationCount:30];
    }
    
    return self;
}

-(StacManResponse*)enqueue:(NSString*)str ofType:(NSString*)type delegate:(NSObject<StacManDelegate>*)del
{
    NSURL* url = [NSURL URLWithString:str];
    
    StacManResponse* ret = [[StacManResponse alloc] initWithClient:self delegate:del];
    
    [_queue addOperationWithBlock:
     ^()
     {
         NSError* error = nil;
         NSData* json = [NSData dataWithContentsOfURL:url options:0 error:&error];
         
         if(error)
         {
             [ret fulfil:nil success:NO error:error];
         }
         else
         {
             StacManWrapper* wrapper = [[StacManWrapper alloc] initWithJson:json type:type];
         
             [ret fulfil:wrapper success:YES error:nil];
         }
     }
     ];
    
    return ret;
}

@end
