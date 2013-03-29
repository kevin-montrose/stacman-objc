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

- (void)testExample
{
    StacManClient* client = [[StacManClient alloc] initWithKey:@"qlH0V6SW0o3bL9n2ElNihg(("];
    StacManQuestionMethods* questions = client.Questions;
    StacManResponse* response = [questions getAllOnSite:@"stackoverflow" filter:@"default" page:1 pagesize:2 fromDate:nil toDate:nil sort:nil minDate:nil maxDate:nil min:nil max:nil order:nil tagged:nil];
    
    STAssertNotNil(response, @"Non nil response");
    STAssertTrue(2 == [response.Data.Items count], @"Got two response");
    
    StacManQuestion* q = [response.Data.Items objectAtIndex:0];
    
    STAssertNotNil(q.owner, @"question owned");
}

@end
