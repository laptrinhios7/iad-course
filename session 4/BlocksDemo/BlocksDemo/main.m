//
//  main.m
//  BlocksDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

//// main.m
//
//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[])
//{
//    @autoreleasepool
//    {
//        // Declare the block variable
//        double (^distanceFromRateAndTime)(double rate, double time);
//        
//        // Create and assign the block
//        distanceFromRateAndTime = ^double(double rate, double time) {
//            return rate * time;
//        };
//        // Call the block
//        double dx = distanceFromRateAndTime(35, 1.5);
//        
//        NSLog(@"A car driving 35 mph will travel " @"%.2f miles in 1.5 hours.", dx);
//    }
//    return 0;
//}

// main.m
#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *theCar = [[Car alloc] init];
        
        // Drive for awhile with constant speed of 5.0 m/s
        [theCar driveForDuration:10.0
               withVariableSpeed:^(double time) {
                   return 5.0;
               } steps:100];
        NSLog(@"The car has now driven %.2f meters", theCar.odometer);
        
        // Start accelerating at a rate of 1.0 m/s^2
        [theCar driveForDuration:10.0
               withVariableSpeed:^(double time) {
                   return time + 5.0;
               } steps:100];
        NSLog(@"The car has now driven %.2f meters", theCar.odometer);
    }
    return 0;
}