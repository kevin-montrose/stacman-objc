//
//  StacManDeserializable.h
//  Stack Exchange
//
//  Created by Arie Litovsky on 9/12/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol StacManDeserializable <NSObject>

@optional
- (void)finishDeserializing;
@end
