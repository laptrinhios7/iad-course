//
//  main.m
//  NSArrayDemo
//
//  Created by Vu Tran Lam on 3/17/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Creating arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        NSArray *ukMakes = [NSArray arrayWithObjects:@"Aston Martin", @"Lotus",
//                            @"Jaguar", @"Bentley", nil];
//        
//        NSLog(@"First german make: %@", germanMakes[0]);
//        NSLog(@"First U.K. make: %@", [ukMakes objectAtIndex:0]);
        
        // Enumerating arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        // With fast-enumeration
//        for (NSString *item in germanMakes)
//        {
//            NSLog(@"%@", item);
//        }
//        // With a traditional for loop
//        for (int i = 0; i < [germanMakes count]; i++)
//        {
//            NSLog(@"%d: %@", i, germanMakes[i]);
//        }
        
        // Using block
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        [germanMakes enumerateObjectsUsingBlock:^(id obj,
//                                                  NSUInteger idx,
//                                                  BOOL *stop) {
//            NSLog(@"%ld: %@", idx, obj);
//        }];
        
        // Comparing arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        NSArray *sameGermanMakes = [NSArray arrayWithObjects:@"Mercedes-Benz",
//                                    @"BMW", @"Porsche", @"Opel",
//                                    @"Volkswagen", @"Audi", nil];
//        
//        if ([germanMakes isEqualToArray:sameGermanMakes])
//        {
//            NSLog(@"Oh good, literal arrays are the same as NSArrays");
//        }
        
        // Membership checking
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        // BOOL checking
//        if ([germanMakes containsObject:@"BMW"])
//        {
//            NSLog(@"BMW is a German auto maker");
//        }
//        // Index checking
//        NSUInteger index = [germanMakes indexOfObject:@"BMW"];
//        if (index == NSNotFound)
//        {
//            NSLog(@"Well that's not quite right...");
//        }
//        else
//        {
//            NSLog(@"BMW is a German auto maker and is at index %ld", index);
//        }
        
        // Sorting arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        NSArray *sortedMakes = [germanMakes sortedArrayUsingComparator:
//                                ^NSComparisonResult(id obj1, id obj2)
//                                {
//                                    if ([obj1 length] < [obj2 length])
//                                    {
//                                        return NSOrderedAscending;
//                                    }
//                                    else if ([obj1 length] > [obj2 length])
//                                    {
//                                        return NSOrderedDescending;
//                                    }
//                                    else
//                                    {
//                                        return NSOrderedSame;
//                                    }
//                                }];
//        NSLog(@"%@", sortedMakes);
        
        // Filtering arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
//                                 @"Opel", @"Volkswagen", @"Audi"];
//        
//        NSArray *lastTwo = [germanMakes subarrayWithRange:NSMakeRange(4, 2)];
//        NSLog(@"%@", lastTwo);    // Volkswagen, Audi
        
        // Subdividing arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        
//        NSArray *lastTwo = [germanMakes subarrayWithRange:NSMakeRange(4, 2)];
//        NSLog(@"%@", lastTwo);    // Volkswagen, Audi
        
        // Combining arrays
//        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel",
//                                 @"Volkswagen", @"Audi"];
//        NSArray *ukMakes = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
//        
//        NSArray *allMakes = [germanMakes arrayByAddingObjectsFromArray:ukMakes];
//        NSLog(@"%@", allMakes);
        
        // String conversion
        NSArray *ukMakes = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
        NSLog(@"%@", [ukMakes componentsJoinedByString:@", "]);
        
    }
    return 0;
}

