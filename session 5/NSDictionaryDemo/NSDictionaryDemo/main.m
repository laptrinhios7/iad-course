//
//  main.m
//  NSDictionaryDemo
//
//  Created by Vu Tran Lam on 3/17/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Creating dictionary
//        // Literal syntax
//        NSDictionary *inventory = @{
//                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
//                                    @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
//                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
//                                    @"BMW X6" : [NSNumber numberWithInt:16],
//                                    };
//        // Values and keys as arguments
//        inventory = [NSDictionary dictionaryWithObjectsAndKeys:
//                     [NSNumber numberWithInt:13], @"Mercedes-Benz SLK250",
//                     [NSNumber numberWithInt:22], @"Mercedes-Benz E350",
//                     [NSNumber numberWithInt:19], @"BMW M3 Coupe",
//                     [NSNumber numberWithInt:16], @"BMW X6", nil];
//        // Values and keys as arrays
//        NSArray *models = @[@"Mercedes-Benz SLK250", @"Mercedes-Benz E350",
//                            @"BMW M3 Coupe", @"BMW X6"];
//        NSArray *stock = @[[NSNumber numberWithInt:13],
//                           [NSNumber numberWithInt:22],
//                           [NSNumber numberWithInt:19],
//                           [NSNumber numberWithInt:16]];
//        inventory = [NSDictionary dictionaryWithObjects:stock forKeys:models];
//        NSLog(@"%@", inventory);
        
        // Accessing keys and values
//        NSDictionary *inventory = @{
//                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
//                                    @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
//                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
//                                    @"BMW X6" : [NSNumber numberWithInt:16],
//                                    };
//        NSLog(@"There are %@ X6's in stock", inventory[@"BMW X6"]);
//        NSLog(@"There are %@ E350's in stock",
//              [inventory objectForKey:@"Mercedes-Benz E350"]);
        
//        NSDictionary *inventory = @{
//                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:0],
//                                    @"Mercedes-Benz E350" : [NSNumber numberWithInt:0],
//                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
//                                    @"BMW X6" : [NSNumber numberWithInt:16],
//                                    };
//        NSArray *outOfStock = [inventory allKeysForObject:
//                               [NSNumber numberWithInt:0]];
//        NSLog(@"The following cars are currently out of stock: %@",
//              [outOfStock componentsJoinedByString:@", "]);
        
        // Enumerating dictionaries
//        NSDictionary *inventory = @{
//                                    @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
//                                    @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
//                                    @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
//                                    @"BMW X6" : [NSNumber numberWithInt:16],
//                                    };
//        NSLog(@"We currently have %ld models available", [inventory count]);
//        for (id key in inventory)
//        {
//            NSLog(@"There are %@ %@'s in stock", inventory[key], key);
//        }
//        
//        NSLog(@"Models: %@", [inventory allKeys]);
//        NSLog(@"Stock: %@", [inventory allValues]);
//        
//        [inventory enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
//        {
//            NSLog(@"There are %@ %@'s in stock", obj, key);
//        }];
        
        // Comparing dictionaries
//        NSDictionary *warehouseInventory = @{
//                                             @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
//                                             @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
//                                             @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
//                                             @"BMW X6" : [NSNumber numberWithInt:16],
//                                             };
//        NSDictionary *showroomInventory = @{
//                                            @"Mercedes-Benz SLK250" : [NSNumber numberWithInt:13],
//                                            @"Mercedes-Benz E350" : [NSNumber numberWithInt:22],
//                                            @"BMW M3 Coupe" : [NSNumber numberWithInt:19],
//                                            @"BMW X6" : [NSNumber numberWithInt:16],
//                                            };
//        if ([warehouseInventory isEqualToDictionary:showroomInventory])
//        {
//            NSLog(@"Why are we storing so many cars in our showroom?");
//        }
        
        // Sorting dictionary keys
//        NSDictionary *prices = @{
//                                 @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"42900.00"],
//                                 @"Mercedes-Benz E350" : [NSDecimalNumber decimalNumberWithString:@"51000.00"],
//                                 @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"62000.00"],
//                                 @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"55015.00"]
//                                 };
//        NSArray *sortedKeys = [prices keysSortedByValueUsingComparator:
//                               ^NSComparisonResult(id obj1, id obj2)
//                               {
//                                   return [obj2 compare:obj1];
//                               }];
//        NSLog(@"%@", sortedKeys);
        
        // Filtering dictionary keys
        NSDictionary *prices = @{
                                 @"Mercedes-Benz SLK250" : [NSDecimalNumber decimalNumberWithString:@"42900.00"],
                                 @"Mercedes-Benz E350" : [NSDecimalNumber decimalNumberWithString:@"51000.00"],
                                 @"BMW M3 Coupe" : [NSDecimalNumber decimalNumberWithString:@"62000.00"],
                                 @"BMW X6" : [NSDecimalNumber decimalNumberWithString:@"55015.00"]
                                 };
        NSDecimalNumber *maximumPrice = [NSDecimalNumber decimalNumberWithString:@"50000.00"];
        NSSet *under50k = [prices keysOfEntriesPassingTest:
                           ^BOOL(id key, id obj, BOOL *stop) {
                               if ([obj compare:maximumPrice] == NSOrderedAscending) {
                                   return YES;
                               } else {
                                   return NO;
                               }
                           }];
        NSLog(@"%@", under50k);
    }
    return 0;
}

