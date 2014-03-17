//
//  main.m
//  NSMutableSetDemo
//
//  Created by Vu Tran Lam on 3/17/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        // NSMutableSet
        //        NSMutableSet *brokenCars = [NSMutableSet setWithObjects:
        //                                    @"Honda Civic", @"Nissan Versa", nil];
        //        NSMutableSet *repairedCars = [NSMutableSet setWithCapacity:5];
        
        // Adding and Removing Objects
        //        NSMutableSet *brokenCars = [NSMutableSet setWithObjects:
        //                                    @"Honda Civic", @"Nissan Versa", nil];
        //        NSMutableSet *repairedCars = [NSMutableSet setWithCapacity:5];
        //        // "Fix" the Honda Civic
        //        [brokenCars removeObject:@"Honda Civic"];
        //        [repairedCars addObject:@"Honda Civic"];
        //
        //        NSLog(@"Broken cars: %@", brokenCars);     // Nissan Versa
        //        NSLog(@"Repaired cars: %@", repairedCars); // Honda Civic
        
        // Filtering With Predicates
        //        NSMutableSet *toyotaModels = [NSMutableSet setWithObjects:@"Corolla", @"Sienna",
        //                                      @"Camry", @"Prius",
        //                                      @"Highlander", @"Sequoia", nil];
        //        NSPredicate *startsWithC = [NSPredicate predicateWithBlock:
        //                                    ^BOOL(id evaluatedObject, NSDictionary *bindings) {
        //                                        if ([evaluatedObject hasPrefix:@"C"]) {
        //                                            return YES;
        //                                        } else {
        //                                            return NO;
        //                                        }
        //                                    }];
        //        [toyotaModels filterUsingPredicate:startsWithC];
        //        NSLog(@"%@", toyotaModels);    // Corolla, Camry
        
        // Set Theory Operations
        //        NSSet *japaneseMakes = [NSSet setWithObjects:@"Honda", @"Nissan", @"Mitsubishi", @"Toyota", nil];
        //        NSSet *johnsFavoriteMakes = [NSSet setWithObjects:@"Honda", nil];
        //        NSSet *marysFavoriteMakes = [NSSet setWithObjects:@"Toyota", @"Alfa Romeo", nil];
        //
        //        NSMutableSet *result = [NSMutableSet setWithCapacity:5];
        //        // Union
        //        [result setSet:johnsFavoriteMakes];
        //        [result unionSet:marysFavoriteMakes];
        //        NSLog(@"Either John's or Mary's favorites: %@", result);
        //        // Intersection
        //        [result setSet:johnsFavoriteMakes];
        //        [result intersectSet:japaneseMakes];
        //        NSLog(@"John's favorite Japanese makes: %@", result);
        //        // Relative Complement
        //        [result setSet:japaneseMakes];
        //        [result minusSet:johnsFavoriteMakes];
        //        NSLog(@"Japanese makes that are not John's favorites: %@", result);
        
        // Enumeration Considerations
        // DO NOT DO THIS. EVER.
        //        NSMutableSet *makes = [NSMutableSet setWithObjects:@"Ford", @"Honda",
        //                               @"Nissan", @"Toyota", nil];
        //        for (NSString *make in makes)
        //        {
        //            NSLog(@"%@", make);
        //            if ([make hasPrefix:@"T"])
        //            {
        //                // Throws an NSGenericException:
        //                // "Collection was mutated while being enumerated"
        //                [makes removeObject:@"Toyota"];
        //            }
        //        }
        
        //        NSMutableSet *makes = [NSMutableSet setWithObjects:@"Ford", @"Honda", @"Nissan", @"Toyota", nil];
        //        NSArray *snapshot = [makes allObjects];
        //        for (NSString *make in snapshot)
        //        {
        //            NSLog(@"%@", make);
        //            if ([make hasPrefix:@"T"])
        //            {
        //                [makes removeObject:@"Toyota"];
        //            }
        //        }
        //        NSLog(@"%@", makes);
        
        // NSCountedSet
        NSCountedSet *inventory = [NSCountedSet setWithCapacity:5];
        [inventory addObject:@"Honda Accord"];
        [inventory addObject:@"Honda Accord"];
        [inventory addObject:@"Nissan Altima"];
        NSLog(@"There are %li Accords in stock and %li Altima",
              [inventory countForObject:@"Honda Accord"],    // 2
              [inventory countForObject:@"Nissan Altima"]);  // 1
    }
    return 0;
}

