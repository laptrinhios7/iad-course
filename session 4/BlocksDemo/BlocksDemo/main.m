//
//  main.m
//  BlocksDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// main.m

//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[])
//{
//    @autoreleasepool
//    {
//        // Declare the block variable
//        double(^distanceFromRateAndTime)(double rate, double time);
//        
//        // Create and assign the block
//        distanceFromRateAndTime = ^double(double rate, double time) {
//            return rate * time;
//        };
//        
//        // Call the block
//        double dx = distanceFromRateAndTime(35, 1.5);
//        
//        NSLog(@"A car driving 35 mph will travel " @"%.2f miles in 1.5 hours.", dx);
//        
//        // Declare parameterless block
//        double(^randomPercent)(void) = ^ {
//            return (double)arc4random() / 4294967295;
//        };
//        NSLog(@"Gas tank is %.1f%% full", randomPercent() * 100);
//        
//        // Block return NSString
////        NSString *(^hello)(NSString *s) = ^(NSString *s){
////            return s;
////        };
//        
//        NSString*(^hello)(NSString *s);
//        hello = ^NSString*(NSString *s)
//        {
//            return s;
//        };
//        
//        NSLog(@"%@",hello(@"Bill Gates"));
//        
//    }
//    return 0;
//}

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
//        // Closures demo
//        // Access non-local variables
//        NSString *make = @"Honda";
//        NSString *(^getFullCarName)(NSString *) = ^(NSString *model)
//        {
//            return [make stringByAppendingFormat:@" %@", model];
//        };
//        NSLog(@"%@",getFullCarName(@"Accord"));      // Honda Accord
//        
//        // Try changing the non-local variable (it won't change the block)
//        make = @"Porsche";
//        NSLog(@"%@", getFullCarName(@"911 Turbo")); // Honda 911 Turbo
        
        // Declare mutable non-local variable
        __block NSString *make = @"Honda";
        
        // Use mutable non-local variable
        __block int i = 0;
        int (^count)(void) = ^ {
            i += 1;
            return i;
        };
        NSLog(@"%d", count());    // 1
        NSLog(@"%d", count());    // 2
        NSLog(@"%d", count());    // 3
        
    }
    return 0;
}

// main.m

/*#import <Foundation/Foundation.h>
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
}*/