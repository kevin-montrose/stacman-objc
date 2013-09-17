//
//  NSString+WebExtensions.m
//  StacMan
//
//  Created by Benjamin Collins on 9/16/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "NSString+Web.h"
#import "SM_GTMNSString+HTML.h"

@implementation NSString (Web)

- (NSString*)decodeHTMLEntities {
    return [self _SM_gtm_stringByUnescapingFromHTML];
}

@end
