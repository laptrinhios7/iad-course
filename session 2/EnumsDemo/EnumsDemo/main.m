//
//  main.m
//  EnumsDemo
//
//  Created by Vu Tran Lam on 3/6/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    FORD,
    HONDA,
    NISSAN,
    PORSCHE
} CarModel;

int main(int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        int modelYear = 1990;
        if (modelYear < 1967) {
            NSLog(@"That car is an antique!!!");
        } else if (modelYear <= 1991) {
            NSLog(@"That car is a classic!");
        } else if (modelYear == 2013) {
            NSLog(@"That's a brand new car!");
        } else {
            NSLog(@"There's nothing special about that car.");
        }

        CarModel myCar = NISSAN;
        switch (myCar)
        {
            case FORD:
            case PORSCHE:
                NSLog(@"You like Western cars?");
                break;
            case HONDA:
            case NISSAN:
                NSLog(@"You like Japanese cars?");
                break;
            default:
                break;
        }
    }
    return 0;
}

