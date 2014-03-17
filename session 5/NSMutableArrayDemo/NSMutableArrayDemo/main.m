//
//  main.m
//  NSMutableArrayDemo
//
//  Created by Vu Tran Lam on 3/17/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Creating mutable arrays
//        NSMutableArray *brokenCars = [NSMutableArray arrayWithObjects:
//                                      @"Audi A6", @"BMW Z3",
//                                      @"Audi Quattro", @"Audi TT", nil];
        
//        // Adding and removing objects
//        NSMutableArray *brokenCars = [NSMutableArray arrayWithObjects:
//                                      @"Audi A6", @"BMW Z3",
//                                      @"Audi Quattro", @"Audi TT", nil];
//        [brokenCars addObject:@"BMW F25"];
//        NSLog(@"%@", brokenCars);       // BMW F25 added to end
//        [brokenCars removeLastObject];
//        NSLog(@"%@", brokenCars);       // BMW F25 removed from end
//        
//        // Add BMW F25 to front
//        [brokenCars insertObject:@"BMW F25" atIndex:0];
//        // Remove BMW F25 from front
//        [brokenCars removeObjectAtIndex:0];
//        // Remove Audi Quattro
//        [brokenCars removeObject:@"Audi Quattro"];
//        
//        // Change second item to Audi Q5
//        [brokenCars replaceObjectAtIndex:1 withObject:@"Audi Q5"];
        
        // Sorting with descriptors
        NSDictionary *car1 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Golf",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"18750.00"]
                               };
        NSDictionary *car2 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Eos",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"35820.00"]
                               };
        NSDictionary *car3 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Jetta A5",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
                               };
        NSDictionary *car4 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Jetta A4",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
                               };
        NSMutableArray *cars = [NSMutableArray arrayWithObjects:
                                car1, car2, car3, car4, nil];
        
        NSSortDescriptor *priceDescriptor = [NSSortDescriptor
                                             sortDescriptorWithKey:@"price"
                                             ascending:YES
                                             selector:@selector(compare:)];
        NSSortDescriptor *modelDescriptor = [NSSortDescriptor
                                             sortDescriptorWithKey:@"model"
                                             ascending:YES
                                             selector:@selector(caseInsensitiveCompare:)];
        
        NSArray *descriptors = @[priceDescriptor, modelDescriptor];
        [cars sortUsingDescriptors:descriptors];
        NSLog(@"%@", cars);    // car4, car3, car1, car2

 
        
    }
    return 0;
}

