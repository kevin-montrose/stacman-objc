//
//  PropertySetter.h
//  StacMan
//
//  Created by Kevin Montrose on 3/28/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "StacManDeserializable.h"

void Parse(Class class, id<StacManDeserializable> inst, NSDictionary* dict);