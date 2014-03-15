//
//  main.m
//  MultiplesSevenDemo
//
//  Created by Vu Tran Lam on 3/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        int counter = 0;
        
        for (int count = 1; count < 100; count++)
        {
            if (count % 7 == 0)
            {
                counter++;
            }
        }
        NSLog(@"Multiples of seven numbers appears %d times", counter);
    }
    return 0;
}

