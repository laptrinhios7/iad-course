//
//  main.m
//  CategoriesDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// main.m

//#import <Foundation/Foundation.h>
//#import "Car.h"
//#import "Car+Maintenance.h"
//
//int main(int argc, const char * argv[])
//{
//    @autoreleasepool
//    {
//        Car *porsche = [[Car alloc] init];
//        porsche.model = @"Porsche 911 Turbo";
//        Car *ford = [[Car alloc] init];
//        ford.model = @"Ford F-150";
//        
//        // "Standard" functionality from Car.h
//        [porsche startEngine];
//        [porsche drive];
//        [porsche turnLeft];
//        [porsche turnRight];
//        
//        // Additional methods from Car+Maintenance.h
//        if ([porsche needsOilChange])
//        {
//            [porsche changeOil];
//        }
//        [porsche rotateTires];
//        [porsche jumpBatteryUsingCar:ford];
//    }
//    return 0;
//}

// main.m --> protected method

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Coupe.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Car *ford = [[Car alloc] init];
        ford.model = @"Ford F-150";
        [ford startEngine];
        [ford drive]; // Calls the protected method
        
        Car *porsche = [[Coupe alloc] init];
        porsche.model = @"Porsche 911 Turbo";
        [porsche startEngine]; // Calls the protected method
        [porsche drive];
        
        // "Protected" methods have not been imported, so this will not work
        //[porsche prepareToDrive];
        
        //SEL protectedMethod = @selector(prepareToDrive);
        SEL protectedMethod = NSSelectorFromString(@"prepareToDrive");
        if ([porsche respondsToSelector:protectedMethod])
        {
            // This will work
            [porsche performSelector:protectedMethod];
        }
    }
    return 0;
}
