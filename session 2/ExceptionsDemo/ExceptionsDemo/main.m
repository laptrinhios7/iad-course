//
//  main.m
//  ExceptionsDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// main.m

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSArray *inventory = @[@"Honda Civic",
                               @"Nissan Versa",
                               @"Ford F-150"];
        int selectedIndex = 3;
        @try
        {
            NSString *car = inventory[selectedIndex];
            NSLog(@"The selected car is: %@", car);
        }
        @catch(NSException *theException)
        {
            NSLog(@"An exception occurred: %@", theException.name);
            NSLog(@"Here are some details: %@", theException.reason);
        }
        @finally
        {
            NSLog(@"Executing finally block");
        }
    }
    return 0;
}
