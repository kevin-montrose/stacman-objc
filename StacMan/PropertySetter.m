//
//  PropertySetter.c
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#include <stdio.h>
#include "PropertySetter.h"

NSString* ToKey(const char* str)
{
    NSMutableString* ret = [NSMutableString string];
    
    CFStringRef cfStr = CFStringCreateWithCString(NULL, str, kCFStringEncodingUTF8);
    
    for(int i = 0; i < CFStringGetLength(cfStr); i++)
    {
        UniChar uc = CFStringGetCharacterAtIndex(cfStr, i);
        
        NSString* asStr = [NSString stringWithCharacters:&uc length:1];
        
        if([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember: uc])
        {
            [ret appendString:@"_"];
            [ret appendString:[asStr lowercaseString]];
        }
        else
        {
            [ret appendString:asStr];
        }
    }
    
    return ret;
}

void Parse(Class class, id inst, NSDictionary* dict)
{
    unsigned int count;
    objc_property_t* props = class_copyPropertyList(class, &count);
    
    for(unsigned int i = 0; i < count; i++)
    {
        const char* name = property_getName(props[i]);
        NSString* propName = [NSString stringWithCString:name encoding:kCFStringEncodingUTF8];
        NSString* asKey = ToKey(name);
        
        id inDict = [dict valueForKey:asKey];
        if(inDict == nil) continue;
        
        [inst setValue:inDict forKey:propName];
    }
}