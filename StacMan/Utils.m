//
//  Utils.m
//  StacMan
//
//  Created by Kevin Montrose on 3/29/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "Utils.h"

NSNumber* ConvertDate(NSDate* date)
{
    if(date == nil) return nil;
    
    NSTimeInterval sinceEpoch = [date timeIntervalSince1970];
    
    long long asSec = (long long)sinceEpoch;
    
    return [NSNumber numberWithLongLong:asSec];
}

NSString* ConvertArray(NSArray* arr)
{
    NSMutableString* ret = [NSMutableString string];
    
    BOOL first = YES;
    for(unsigned int i = 0; i < arr.count; i++)
    {
        if(!first)
        {
            [ret appendString:@";"];
        }
        
        [ret appendFormat:@"%@", [arr objectAtIndex:i]];
    }

    return ret;
}