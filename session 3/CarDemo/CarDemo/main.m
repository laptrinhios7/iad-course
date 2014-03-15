//
//  main.m
//  CarDemo
//
//  Created by Vu Tran Lam on 3/11/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Car *toyota = [[Car alloc]init];
        //Car *toyota = [[Car alloc]initWithModel:@"Toyota Corolla"];
        
        
        // Use get/set model method to update car's model
        [toyota setModel:@"Toyota Corolla"];
        NSLog(@"Created a %@", [toyota model]);
        
        // Use property to update car's model
        toyota.model = @"Toyota Camry";
        NSLog(@"Changed the car to %@", toyota.model);
 
        // Call method drive of toyota object
        [toyota drive];
        
        // Call class method
        [Car setDefaultModel:@"Nissan Versa"];
        
        
        Person *john = [[Person alloc]init];
        john.name = @"John";
        
        Car *honda = [[Car alloc]init];
        NSMutableString *model = [NSMutableString stringWithFormat:@"Honda Civic"];
        honda.model = model;
        NSLog(@"%@", honda.model);
        
        [model setString:@"Nissa Versa"];
        NSLog(@"%@", honda.model);          // Still Honda Civic
        
        
        honda.driver = john;
        john.car = honda;   // Add this line
        
        
        NSLog(@"%@ drives a %@", honda.driver, honda.model);
    }
    return 0;
}

