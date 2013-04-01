//
//  StacManTests.m
//  StacManTests
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManTests.h"
#import "StacManClient.h"
#import "StacManQuestion.h"
#import "StacManRelatedSite.h"
#import "StacManAnswer.h"
#import "StacManComment.h"

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
    
    STAssertNotNil(a.owner, @"question owned");
}

- (void)testQuestionsGetComments
{
    StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
    StacManQuestionMethods* questions = client.questions;
    StacManResponse* response = [questions getComments:@"stackoverflow" ids:@[@11227809] filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil];
    
    STAssertNotNil(response, @"Non nil response");
    
    STAssertTrue(1 < [response.data.items count], @"Got more than 1 comment");
    
    StacManComment* c = [response.data.items objectAtIndex:0];
    
    STAssertNotNil(c.owner, @"question owned");
}

@end
