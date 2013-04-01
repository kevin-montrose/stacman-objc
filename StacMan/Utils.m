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

NSString* MinMax(int count, id first, ...)
{
    va_list ap;
    
    id ret = nil;
    
    va_start(ap, first);
    
    for(int i=0; i<count; i++)
    {
        id opt = va_arg(ap, id);
        if(opt != nil)
        {
            ret = opt;
        }
    }
    
    va_end(ap);
    
    if(ret == nil) return @"";
    
    return [NSString stringWithFormat:@"%@", ret];
}