//
//  main.m
//  StructsDemo
//
//  Created by Vu Tran Lam on 3/6/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
    unsigned char red;
    unsigned char green;
    unsigned char blue;
} Color;

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Color carColor = {255, 160, 0};
        NSLog(@"Your paint job is (R: %hhu, G: %hhu, B: %hhu)", carColor.red, carColor.green, carColor.blue);
    }
    return 0;
}


