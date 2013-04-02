//
//  StacManFilterMethods.m
//  StacMan
//
//  Created by Kevin Montrose on 4/2/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManFilterMethods.h"

@implementation StacManFilterMethods
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

-(StacManResponse*)readFilters:(NSArray*)filters filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/filters/%@?key=%@&filter=%@",
     ConvertArray(filters),
     key,
     filter ?: @""
     ];
    
    return [client enqueue:url ofType:@"filter" delegate:del];
}

-(StacManResponse*)createFilterWithIncludes:(NSArray*)includes excludes:(NSArray*)excludes base:(NSString*)base unsafe:(BOOL)unsafe filter:(NSString*)filter delegate:(NSObject<StacManDelegate>*)del
{
    NSString* key = client.key;
    
    NSString* url =
    [NSString
     stringWithFormat:@"https://api.stackexchange.com/2.1/filters/create?key=%@&filter=%@&includes=%@&excludes=%@&base=%@&unsafe=%@",
     key,
     filter ?: @"",
     ConvertArray(includes),
     ConvertArray(excludes),
     base ?: @"",
     (unsafe ? @"true" : @"false")
     ];
    
    return [client enqueue:url ofType:@"filter" delegate:del];
}
@end
