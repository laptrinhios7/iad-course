//
//  main.m
//  MacrosDemo
//
//  Created by Vu Tran Lam on 3/6/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

// Define macros
#define PI 3.14159
#define RAD_TO_DEG(radians) (radians * (180.0 / PI))

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        double angle = PI / 2;              // 1.570795
        NSLog(@"%f", RAD_TO_DEG(angle));    // 90.0
    }
    return 0;
}


