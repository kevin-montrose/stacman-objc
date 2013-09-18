//
//  StacMan.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManClient.h"
#import <libkern/OSAtomic.h>

@implementation StacManClient

@synthesize delegate;

@synthesize questions = _questions;
@synthesize users = _users;
@synthesize sites = _sites;
@synthesize accessTokens = _accessTokens;
@synthesize answers = _answers;
@synthesize applications = _applications;
@synthesize badges = _badges;
@synthesize comments = _comments;
@synthesize errors = _errors;
@synthesize events = _events;
@synthesize filters = _filters;
@synthesize inbox = _inbox;
@synthesize info = _info;
@synthesize posts = _posts;
@synthesize privileges = _privileges;
@synthesize revisions = _revisions;
@synthesize search = _search;
@synthesize suggestedEdits = _suggestedEdits;
@synthesize tags = _tags;

@synthesize key = _key;
@synthesize queue = _queue;

-(id)initWithKey:(NSString*)key;
{
    self = [super init];
    
    if(self)
    {
        currentRequestCount = 0;
        
        _key = key;
        
        _questions = [[StacManQuestionMethods alloc] initWithClient:self];
        _users = [[StacManUserMethods alloc] initWithClient:self];
        _sites = [[StacManSiteMethods alloc] initWithClient:self];
        _accessTokens = [[StacManAccessTokenMethods alloc] initWithClient:self];
        _answers = [[StacManAnswerMethods alloc] initWithClient:self];
        _applications = [[StacManApplicationMethods alloc] initWithClient:self];
        _badges = [[StacManBadgeMethods alloc] initWithClient:self];
        _comments = [[StacManCommentMethods alloc] initWithClient:self];
        _errors = [[StacManErrorMethods alloc] initWithClient:self];
        _events = [[StacManEventMethods alloc] initWithClient:self];
        _filters = [[StacManFilterMethods alloc] initWithClient:self];
        _inbox = [[StacManInboxMethods alloc] initWithClient:self];
        _info = [[StacManInfoMethods alloc] initWithClient:self];
        _posts = [[StacManPostMethods alloc] initWithClient:self];
        _privileges = [[StacManPrivilegeMethods alloc] initWithClient:self];
        _revisions = [[StacManRevisionMethods alloc] initWithClient:self];
        _search = [[StacManSearchMethods alloc] initWithClient:self];
        _suggestedEdits = [[StacManSuggestedEditMethods alloc] initWithClient:self];
        _tags = [[StacManTagMethods alloc] initWithClient:self];
        
        _queue = [[NSOperationQueue alloc] init];
        [_queue setMaxConcurrentOperationCount:30];
        
        backoffs = [NSMutableDictionary dictionaryWithCapacity:10];
        
        globalBlock = dispatch_semaphore_create(30);
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
        
        _tier = StacManTierProd;
        
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1.0, 0);
        dispatch_source_set_event_handler(timer, ^{ [self resetGlobalBlock]; });
        dispatch_resume(timer);
        
    }
    
    return self;
}

-(void)resetGlobalBlock
{
    int maxRelease;
    while(true)
    {
        maxRelease = currentRequestCount;
        int resetValue = maxRelease <= 30 ? 0 : maxRelease - 30;
        
        if(OSAtomicCompareAndSwap32(maxRelease, resetValue, &currentRequestCount))
        {
            break;
        }
    }

    int toRelease = maxRelease > 30 ? 30 : maxRelease;
    for(int i = 0; i < toRelease; i++)
    {
        dispatch_semaphore_signal(globalBlock);
    }
}

-(StacManResponse*)enqueue:(NSString*)str ofType:(Class)type delegate:(NSObject<StacManDelegate>*)del backoffKey:(NSString*)backoff {
    
    NSURL *url;
    if (_tier == StacManTierDev)
    {
        NSMutableString *devStr = [NSMutableString stringWithString:str];
        [devStr replaceOccurrencesOfString:@"https://api." withString:@"http://dev.api." options:NSCaseInsensitiveSearch range:NSMakeRange(0, [devStr length])];
        url = [NSURL URLWithString:devStr];
    } else
    {
        url = [NSURL URLWithString:str];
    }
    
    StacManResponse* ret = [[StacManResponse alloc] initWithClient:self delegate:del];
    
    OSAtomicIncrement32(&currentRequestCount);
    
    dispatch_semaphore_t blockOn = globalBlock;
    
    [_queue addOperationWithBlock:
     ^()
     {
         dispatch_semaphore_wait(blockOn, DISPATCH_TIME_FOREVER);
         
         NSNumber* waitFor;
         @synchronized(backoffs)
         {
             waitFor = [backoffs valueForKey:backoff];
         }
         
         if(waitFor)
         {
             sleep([waitFor intValue]);
         }
         
         NSError* error = nil;
         NSData* json = [NSData dataWithContentsOfURL:url options:0 error:&error];
         
         if(error)
         {
             [ret fulfil:nil success:NO error:error];
         }
         else
         {
             StacManWrapper* wrapper = [[StacManWrapper alloc] initWithJson:json forClass:type];
         
             if(wrapper.backoff > 0)
             {
                 [self enforceBackoff: backoff forSeconds:wrapper.backoff];
             }
             
             [ret fulfil:wrapper success:YES error:nil];
         }
     }
     ];
    
    return ret;
}

-(void)enforceBackoff:(NSString*)key forSeconds:(int)forSeconds
{
    @synchronized(backoffs)
    {
        [backoffs setValue:[NSNumber numberWithInt:forSeconds] forKey:key];
    }
}
@end
