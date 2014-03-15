//
//  main.m
//  SumStudentMarksDemo
//
//  Created by Vu Tran Lam on 3/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        double marks[10];
        double sum = 0;
        double avg = 0;
        for (int i = 0; i < 10; i++)
        {
            NSLog(@"Input mark of student %d: ", i + 1);
            scanf("%lf", &marks[i]);
            sum += marks[i];
        }
        avg = sum / 10;
        NSLog(@"Sum of marks = %.1lf", sum);
        NSLog(@"Average of marks = %.1lf", avg);
    }
    return 0;
}

