//
//  main.m
//  FunctionsDemo
//
//  Created by Vu Tran Lam on 3/8/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int getRandomInteger(int minimum, int maximum)
{
    // Return the random integer less than ((maximum - minimum) + 1) + minimum)
    return arc4random_uniform((maximum - minimum) + 1) + minimum;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        for (int i = 0; i < 10; i++)
        {
            int randomNumber = getRandomInteger(1, 100);
            NSLog(@"Selected a random number between -10 and 10: %d", randomNumber);
        }
    }
    return 0;
}

