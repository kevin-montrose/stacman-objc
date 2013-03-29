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

NSDate* ParseDate(NSNumber* num)
{
    return [NSDate dateWithTimeIntervalSince1970:[num longLongValue]];
}

Class GetClass(const char* attr)
{
    CFStringRef cfStr = CFStringCreateWithCString(NULL, attr, kCFStringEncodingUTF8);
    
    CFStringRef quoteLit = (CFStringRef)@"\"";
    
    CFRange i = CFStringFind(cfStr, quoteLit, 0);
    CFRange subSearch = CFRangeMake(i.location+1, strlen(attr) - i.location-1);
    CFRange j;
    CFStringFindWithOptions(cfStr, quoteLit, subSearch, 0, &j);
    
    CFStringRef name = CFStringCreateWithSubstring(NULL, cfStr, CFRangeMake(i.location + 1, j.location - i.location - 1));
    
    NSString* asNSStr = (__bridge NSString*)name;
    
    return NSClassFromString(asNSStr);
}

id Convert(objc_property_t prop, id obj)
{
    const char* attrs = property_getAttributes(prop);
    
    BOOL isDate = strstr(attrs, "T@\"NSDate") != NULL;
    
    if(isDate)
    {
        return ParseDate((NSNumber*)obj);
    }
    
    BOOL isStacManType = strstr(attrs, "T@\"StacMan") != NULL;
    
    if(isStacManType)
    {
        Class stacManType = GetClass(attrs);
        id ret = [stacManType alloc];
        ret = [ret init];
        
        Parse(stacManType, ret, (NSDictionary*)obj);
        
        return ret;
    }
    
    return obj;
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
        
        inDict = Convert(props[i], inDict);
        
        [inst setValue:inDict forKey:propName];
    }
}