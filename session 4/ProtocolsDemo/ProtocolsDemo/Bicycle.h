//
//  Bicycle.h
//  ProtocolsDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Bicycle.h

#import <Foundation/Foundation.h>
#import "StreetLegal.h"

@interface Bicycle : NSObject<StreetLegal>

- (void)startPedaling;
- (void)removeFrontWheel;
- (void)lockToStructure:(id)theStructure;

@end
