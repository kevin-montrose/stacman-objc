//
//  StacManTests.m
//  StacManTests
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTests.h"
#import "StacMan.h"

@implementation StacManTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testQuestionsGetAll
{
    StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
    StacManQuestionMethods* questions = client.questions;
    StacManResponse* response = [questions getAllOnSite:@"stackoverflow" filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil tagged:nil];
    
    STAssertNotNil(response, @"Non nil response");
    
    STAssertTrue(2 == [response.data.items count], @"Got two questions");
    
    StacManQuestion* q = [response.data.items objectAtIndex:0];
    
    STAssertNotNil(q.owner, @"question owned");
}

- (void)testQuestionsGetByIds
{
    StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
    StacManQuestionMethods* questions = client.questions;
    StacManResponse* response = [questions getByIdsOnSite:@"stackoverflow" ids:@[@5483594] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil tagged:nil];
    
    STAssertNotNil(response, @"Non nil response");
    
    StacManWrapper* data = response.data;
    
    STAssertTrue(1 == [data.items count], @"Got one question");
    
    StacManQuestion* q = [response.data.items objectAtIndex:0];
    
    STAssertNotNil(q.owner, @"question owned");
    NSArray* related = q.migratedTo.otherSite.relatedSites;
    STAssertNotNil(related, @"Related sites set");
    StacManRelatedSite* otherSite = [related objectAtIndex:0];
    STAssertNotNil(otherSite, @"Has related");
    STAssertEqualObjects(@"meta", otherSite.relation, @"is meta");
}

- (void)testQuestionsGetAnswers
{
    StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
    StacManQuestionMethods* questions = client.questions;
    StacManResponse* response = [questions getAnswers:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil];
    
    STAssertNotNil(response, @"Non nil response");
    
    STAssertTrue(1 < [response.data.items count], @"Got more than 1 answer");
    
    StacManAnswer* a = [response.data.items objectAtIndex:0];
    
    STAssertNotNil(a.owner, @"answer owned");
}

- (void)testQuestionsGetComments
{
    StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
    StacManQuestionMethods* questions = client.questions;
    StacManResponse* response = [questions getComments:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil];
    
    STAssertNotNil(response, @"Non nil response");
    
    STAssertTrue(1 < [response.data.items count], @"Got more than 1 comment");
    
    StacManComment* c = [response.data.items objectAtIndex:0];
    
    STAssertNotNil(c.owner, @"comment owned");
}

-(void)testSempahoreBadTouch
{
    {
        StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
        StacManQuestionMethods* questions = client.questions;
        StacManResponse* response = [questions getComments:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil];
        
        STAssertNotNil(response, @"Non nil response");
        
        STAssertTrue(1 < [response.data.items count], @"Got more than 1 comment");
        
        for(unsigned int i = 0; i < [response.data.items count]; i++)
        {
            StacManComment* c = [response.data.items objectAtIndex:i];
            
            STAssertNotNil(c.owner, @"comment owned");
        }
    }
    
    {
        StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
        StacManQuestionMethods* questions = client.questions;
        StacManResponse* response = [questions getComments:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil];
        
        STAssertNotNil(response, @"Non nil response");
        
        // note that data is never touched, so no block ever happens (semaphore should still be released)
    }
}

-(void)testMinMax
{
    {
        StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
        StacManQuestionMethods* questions = client.questions;
        StacManResponse* response = [questions getComments:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:@"votes" minDate:nil maxDate:nil min:@1 max:nil order:nil];
        
        STAssertNotNil(response, @"Non nil response");
        
        STAssertTrue(1 < [response.data.items count], @"Got more than 1 comment");
        
        for(unsigned int i = 0; i < [response.data.items count]; i++)
        {
            StacManComment* c = [response.data.items objectAtIndex:i];
            
            STAssertTrue([c.score intValue] >= 1, @"score min enforced");
        }
    }
    
    {
        StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
        StacManQuestionMethods* questions = client.questions;
        StacManResponse* response = [questions getComments:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:@"votes" minDate:nil maxDate:nil min:nil max:@3 order:nil];
        
        STAssertNotNil(response, @"Non nil response");
        
        STAssertTrue(1 < [response.data.items count], @"Got more than 1 comment");
        
        for(unsigned int i = 0; i < [response.data.items count]; i++)
        {
            StacManComment* c = [response.data.items objectAtIndex:i];
            
            STAssertTrue([c.score intValue] <= 3, @"score max enforced");
        }
    }
}

-(void)testGetAllUsers
{
    {
        StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
        StacManUserMethods* users = client.users;
        StacManResponse* response = [users getAllOnSite:@"stackoverflow" filter:nil page:1 pageSize:1 fromDate:nil toDate:nil sort:@"reputation" min:nil max:nil minDate:nil maxDate:nil minName:nil maxName:nil order:nil inName:nil];
        
        STAssertNotNil(response, @"Non nil response");
        
        STAssertTrue(1 == [response.data.items count], @"Got more than 1 user");
        
        StacManUser* jon = [response.data.items objectAtIndex:0];
        STAssertEqualObjects(@"Jon Skeet", jon.displayName, @"Is Jon Skeet");
    }
}

@end
