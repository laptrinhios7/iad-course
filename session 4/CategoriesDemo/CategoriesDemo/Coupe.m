//
//  Coupe.m
//  CategoriesDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Coupe.m

#import "Coupe.h"
#import "Car+Protected.h"

@implementation Coupe

- (void)startEngine
{
    [super startEngine];
    // Call the protected method here instead of in 'drive'
    [self prepareToDrive];
}

- (void)drive
{
    NSLog(@"VROOOOOOM!");
}

@end