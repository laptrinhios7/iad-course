//
//  Car.m
//  CarDemo
//
//  Created by Vu Tran Lam on 3/11/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import "Car.h"

static NSString *_defaultModel;

@implementation Car
{
    // Protected instance variables (not recommended)
    double odometer;
}

@synthesize model = _model; // optional for Xcode 4.4+

@synthesize running = _running;

- (id)initWithModel:(NSString *)aModel
{
    self = [super init];
    if (self)
    {
        _model = [aModel copy];
        odometer = 0;
    }
    return self;
}


+ (void)setDefaultModel:(NSString *)aModel
{
    _defaultModel = [aModel copy];
}

- (void)drive
{
    NSLog(@"Drive a %@ Vrooooom!", self.model);
}

- (void)startEngine
{
    _running = YES;
    NSLog(@"Car is running!");
}

- (void)stopEngine
{
    _running = NO;
    NSLog(@"Car is stopped");
}



@end
