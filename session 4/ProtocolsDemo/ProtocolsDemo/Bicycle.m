//
//  Bicycle.m
//  ProtocolsDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Bicycle.m

#import "Bicycle.h"

@implementation Bicycle

- (void)signalStop
{
    NSLog(@"Bending left arm downwards");
}
- (void)signalLeftTurn
{
    NSLog(@"Extending left arm outwards");
}
- (void)signalRightTurn
{
    NSLog(@"Bending left arm upwards");
}
- (void)startPedaling
{
    NSLog(@"Here we go!");
}
- (void)removeFrontWheel
{
    NSLog(@"Front wheel is off."
          "Should probably replace that before pedaling...");
}
- (void)lockToStructure:(id)theStructure
{
    NSLog(@"Locked to structure. Don't forget the combination!");
}

@end
