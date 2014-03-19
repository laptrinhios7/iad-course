//
//  Car.m
//  CategoriesDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.m
#import "Car.h"

// The class extension
@interface Car ()

// Override the property and method inside of a class extension
@property (strong, readwrite) Person *driver;
- (BOOL)engineIsWorking;

@end

// The main implementation
@implementation Car

@synthesize model = _model;
@synthesize driver = _driver;

- (id)initWithDriver:(Person *)driver
{
    self = [super init];
    if (self)
    {
        // This will work because of the extension
        [self setDriver:driver];
    }
    return self;
}

- (BOOL)engineIsWorking
{
    // In the real world, this would probably return a useful value
    return YES;
}
- (void)startEngine
{
    // This will work because of the extension
    if ([self engineIsWorking])
    {
        NSLog(@"Starting the %@'s engine", _model);
    }
}

- (void)drive
{
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

