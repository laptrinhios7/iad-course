//
//  main.m
//  SumEvenNumsDemo
//
//  Created by Vu Tran Lam on 3/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        int sum = 0;
        for (int count = 0; count < 20; count += 2)
        {
            sum += count;
        }
        NSLog(@"Sum of the first ten even numbers is %d", sum);
    }
    return 0;
}

