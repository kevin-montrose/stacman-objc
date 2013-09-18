//
//  StacManWrapper.m
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManWrapper.h"
#import "StacManQuestion.h"
#import "StacManAnswer.h"
#import "StacManComment.h"
#import "StacManQuestionTimeline.h"
#import "StacManUser.h"
#import "StacManBadge.h"
#import "StacManPrivilege.h"
#import "StacManReputation.h"
#import "StacManSuggestedEdit.h"
#import "StacManTag.h"
#import "StacManUserTimeline.h"
#import "StacManTopTag.h"
#import "StacManInboxItem.h"
#import "StacManNetworkUser.h"
#import "StacManAccessToken.h"
#import "StacManError.h"
#import "StacManEvent.h"
#import "StacManFilter.h"
#import "StacManInfo.h"
#import "StacManPost.h"
#import "StacManRevision.h"
#import "StacManTagSynonym.h"
#import "StacManTagScore.h"
#import "StacManTagWiki.h"


@implementation StacManWrapper

NSDictionary* m_parsed = nil;

id TryGet(NSDictionary* dict, NSString* key, id defaultValue)
{
    BOOL exists = [[dict allKeys] containsObject:key];
    
    if(!exists) return defaultValue;
    
    return [dict valueForKey:key];
}

-(id)initWithJson:(NSData*)data forClass:(Class)cls {
    self = [super init];
    
    if(self)
    {
        if (!cls /* TODO: need to check against a future StacManModelBase here*/) {
            self = nil;
        } else {
            _type = cls;
            NSError *e;
            m_parsed = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingMutableContainers
                                                         error: &e];
            
            NSArray* i = TryGet(m_parsed, @"items", nil);
            self.items = [_type parseArray:i];
            
            self.error = e;
            self.backoff = [TryGet(m_parsed, @"backoff", [NSNumber numberWithBool:NO]) boolValue];
            self.errorId = [TryGet(m_parsed, @"error_id", [NSNumber numberWithInt:0]) intValue];
            self.errorMessage = TryGet(m_parsed, @"error_message", nil);
            self.hasMore = [TryGet(m_parsed, @"has_more", [NSNumber numberWithBool:NO]) boolValue];
            self.page = [TryGet(m_parsed, @"page", [NSNumber numberWithInt:0]) intValue];
            self.pageSize = [TryGet(m_parsed, @"page_size", [NSNumber numberWithInt:0]) intValue];
            self.quotaMax = [TryGet(m_parsed, @"quota_max", [NSNumber numberWithInt:0]) intValue];
            self.quotaRemaining = [TryGet(m_parsed, @"quota_remaining", [NSNumber numberWithInt:0]) intValue];
            self.total = [TryGet(m_parsed, @"total", [NSNumber numberWithInt:0]) intValue];
        }
    }
    
    return self;
}

@end
