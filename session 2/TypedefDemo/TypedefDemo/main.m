//
//  main.m
//  TypedefDemo
//
//  Created by Vu Tran Lam on 3/6/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef unsigned char ColorComponent;

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        ColorComponent red = 255;
        ColorComponent green = 160;
        ColorComponent blue = 0;
        NSLog(@"Your paint job is (R: %hhu, G: %hhu, B: %hhu)", red, green, blue);
    }
    return 0;
}


