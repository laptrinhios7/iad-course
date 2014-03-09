//
//  main.m
//  FirstProgram
//
//  Created by Vu Tran Lam on 3/4/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        char charType = 'A';
        double doubleType = 9200.8;
        // Casting double value to int value
        int intType = (int)doubleType;
        id idType = @"Hello World";
        
        NSLog(@"Character value: %c", charType);
        NSLog(@"Double value: %.1f", doubleType);     // 9200.8
        NSLog(@"Integer value: %d", intType);         // 9200
        NSLog(@"id value: %p", idType);
        NSLog(@"id type description: %@", [idType description]);
    }
    return 0;
}

