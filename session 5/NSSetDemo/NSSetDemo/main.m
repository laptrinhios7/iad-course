//
//  main.m
//  NSSetDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        // Creating NSSet
//        NSSet *americanMakes = [NSSet setWithObjects:@"Chrysler", @"Ford",
//                                @"General Motors", nil];
//        NSLog(@"%@", americanMakes);
//        
//        NSArray *japaneseMakes = @[@"Honda", @"Mazda",
//                                   @"Mitsubishi", @"Honda"];
//        NSSet *uniqueMakes = [NSSet setWithArray:japaneseMakes];
//        NSLog(@"%@", uniqueMakes);    // Honda, Mazda, Mitsubishi
        
        // Enumerating Sets
//        NSSet *models = [NSSet setWithObjects:@"Civic", @"Accord",
//                         @"Odyssey", @"Pilot", @"Fit", nil];
//        NSLog(@"The set has %li elements", [models count]);
//        for (id item in models)
//        {
//            NSLog(@"%@", item);
//        }
//        // Using block-based solution
//        [models enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
//        {
//            NSLog(@"Current item: %@", obj);
//            if ([obj isEqualToString:@"Fit"])
//            {
//                NSLog(@"I was looking for a Honda Fit, and I found it!");
//                *stop = YES;    // Stop enumerating items
//            }
//        }];
        
        // Comparing Sets
//        NSSet *japaneseMakes = [NSSet setWithObjects:@"Honda", @"Nissan",
//                                @"Mitsubishi", @"Toyota", nil];
//        NSSet *johnsFavoriteMakes = [NSSet setWithObjects:@"Honda", nil];
//        NSSet *marysFavoriteMakes = [NSSet setWithObjects:@"Toyota",
//                                     @"Alfa Romeo", nil];
//        
//        if ([johnsFavoriteMakes isEqualToSet:japaneseMakes]) {
//            NSLog(@"John likes all the Japanese auto makers and no others");
//        }
//        if ([johnsFavoriteMakes intersectsSet:japaneseMakes]) {
//            // You'll see this message
//            NSLog(@"John likes at least one Japanese auto maker");
//        }
//        if ([johnsFavoriteMakes isSubsetOfSet:japaneseMakes]) {
//            // And this one, too
//            NSLog(@"All of the auto makers that John likes are Japanese");
//        }
//        if ([marysFavoriteMakes isSubsetOfSet:japaneseMakes]) {
//            NSLog(@"All of the auto makers that Mary likes are Japanese");
//        }
        
        // Membership Checking
//        NSSet *selectedMakes = [NSSet setWithObjects:@"Maserati", @"Porsche", nil];
//        // BOOL checking
//        if ([selectedMakes containsObject:@"Maserati"]) {
//            NSLog(@"The user seems to like expensive cars");
//        }
//        // nil checking
//        NSString *result = [selectedMakes member:@"Maserati"];
//        if (result != nil) {
//            NSLog(@"%@ is one of the selected makes", result);
//        }
        
        // Filtering Sets
//        NSSet *toyotaModels = [NSSet setWithObjects:@"Corolla", @"Sienna", @"Camry", @"Prius",
//                                                    @"Highlander", @"Sequoia", nil];
//        NSSet *cModels = [toyotaModels objectsPassingTest:^BOOL(id obj, BOOL *stop) {
//            if ([obj hasPrefix:@"C"]) {
//                return YES;
//            } else {
//                return NO;
//            }
//        }];
//        NSLog(@"%@", cModels);    // Corolla, Camry
        
        // Combining Sets
        NSSet *affordableMakes = [NSSet setWithObjects:@"Ford", @"Honda", @"Nissan", @"Toyota", nil];
        NSSet *fancyMakes = [NSSet setWithObjects:@"Ferrari", @"Maserati", @"Porsche", nil];
        NSSet *allMakes = [affordableMakes setByAddingObjectsFromSet:fancyMakes];
        NSLog(@"%@", allMakes);
        
    }
    return 0;
}

