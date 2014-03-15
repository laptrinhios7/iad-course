//
//  Car.m
//  CategoriesDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.m
#import "Car.h"
#import "Car+Protected.h"

// The class extension
@interface Car ()

- (BOOL)engineIsWorking;

@end

@implementation Car

@synthesize model = _model;

- (BOOL)engineIsWorking {
    // In the real world, this would probably return a useful value
    return YES;
}
- (void)startEngine {
    if ([self engineIsWorking]) {
        NSLog(@"Starting the %@'s engine", _model);
    }
}

- (void)drive
{
    // Use the protected prepareToDrive method
    [self prepareToDrive];
    NSLog(@"The %@ is now driving", _model);
}

- (void)turnLeft
{
    NSLog(@"The %@ is turning left", _model);
}

- (void)turnRight
{
    NSLog(@"The %@ is turning right", _model);
}

@end

