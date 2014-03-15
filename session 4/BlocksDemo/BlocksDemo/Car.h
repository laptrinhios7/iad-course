//
//  Car.h
//  BlocksDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.h

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property double odometer;

- (void)driveForDuration:(double)duration
       withVariableSpeed:(double (^)(double time))speedFunction
                   steps:(int)numSteps;

@end