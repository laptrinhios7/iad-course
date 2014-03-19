//
//  main.m
//  ExtensionsDemo
//
//  Created by Vu Tran Lam on 3/19/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// main.m

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Person *steve = [[Person alloc] init];
        steve.name = @"Steve Jobs";
        Car *bmwX5 = [[Car alloc] initWithDriver:steve];
        NSLog(@"%@", [bmwX5 driver].name);
        
        Person *bill = [[Person alloc] init];
        bill.name = @"Bill Gates";
        // This will not work because the property is still read-only.
        // [bmwX5 setDriver:bill];
    }
    return 0;
}

