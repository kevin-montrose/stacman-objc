//
//  StacManPrivilege.m
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManPrivilege.h"
#import "PropertySetter.h"

@implementation StacManPrivilege

@synthesize description;
@synthesize reputation;
@synthesize shortDescription;

+(StacManPrivilege*)parse:(NSDictionary*)dict
{
    StacManPrivilege* ret = [[StacManPrivilege alloc] init];
    
    if(ret)
    {
        Parse([StacManPrivilege class], ret, dict);
    }
    
    return ret;
}

+(NSArray*)parseArray:(NSArray*)json
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:json.count];
    
    for(int i = 0; i < json.count;i++)
    {
        [ret addObject:[StacManPrivilege parse:[json objectAtIndex:i]]];
    }
    
    return ret;
}
@end
