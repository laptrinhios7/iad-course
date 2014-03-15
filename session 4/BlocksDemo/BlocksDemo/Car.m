//
//  Car.m
//  BlocksDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.m
#import "Car.h"

@implementation Car

@synthesize odometer = _odometer;

- (void)driveForDuration:(double)duration
       withVariableSpeed:(double (^)(double time))speedFunction
                   steps:(int)numSteps
{
    double dt = duration / numSteps;
    for (int i = 1; i <= numSteps; i++)
    {
        _odometer += speedFunction(i * dt) * dt;
    }
}

@end