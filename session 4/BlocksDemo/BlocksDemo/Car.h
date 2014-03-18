//
//  Car.h
//  BlocksDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.h

#import <Foundation/Foundation.h>

// Define a new type for block
typedef double(^SpeedFunction)(double);

@interface Car : NSObject

@property double odometer;

//- (void)driveForDuration:(double)duration
//       withVariableSpeed:(double (^)(double time))speedFunction
//                   steps:(int)numSteps;

// Use SpeedFunction block
- (void)driveForDuration:(double)duration
       withVariableSpeed:(SpeedFunction)speedFunction
                   steps:(int)numSteps;

@end