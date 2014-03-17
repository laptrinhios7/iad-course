//
//  main.m
//  NSStringDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //NSString *make = @"Côte d'Ivoire";
//        NSString *make = @"Porsche";
//        NSString *model = @"911";
//        int year = 1968;
//        NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d!",
//                             make, model, year];
//        NSLog(@"%@", message);
        
//        NSString *make = @"Porsche";
//        for (int i=0; i<[make length]; i++)
//        {
//            unichar letter = [make characterAtIndex:i];
//            NSLog(@"%d: %hu", i, letter);
//        }
        
//        NSString *car = @"Porsche Boxster";
//        if ([car isEqualToString:@"Porsche Boxster"])
//        {
//            NSLog(@"That car is a Porsche Boxster");
//        }
//        if ([car hasPrefix:@"Porsche"])
//        {
//            NSLog(@"That car is a Porsche of some sort");
//        }
//        if ([car hasSuffix:@"Carrera"])
//        {
//            // This won't execute
//            NSLog(@"That car is a Carrera");
//        }
        
//        NSString *car = @"Porsche Boxster";
//        NSString *otherCar = @"Ferrari";
//        NSComparisonResult result = [car compare:otherCar];
//        if (result == NSOrderedAscending)
//        {
//            NSLog(@"The letter 'P' comes before 'F'");
//        }
//        else if (result == NSOrderedSame)
//        {
//            NSLog(@"We're comparing the same string");
//        }
//        else if (result == NSOrderedDescending)
//        {
//            NSLog(@"The letter 'P' comes after 'F'");
//        }
        
//        NSString *make = @"Ferrari";
//        NSString *model = @"458 Spider";
//        NSString *car = [make stringByAppendingString:model];
//        NSLog(@"%@", car);        // Ferrari458 Spider
//        car = [make stringByAppendingFormat:@" %@", model];
//        NSLog(@"%@", car);        // Ferrari 458 Spider (note the space)
        
        // Searching Strings
//        NSString *car = @"Maserati GranCabrio";
//        NSRange searchResult = [car rangeOfString:@"Cabrio"];
//        if (searchResult.location == NSNotFound)
//        {
//            NSLog(@"Search string was not found");
//        }
//        else
//        {
//            NSLog(@"'Cabrio' starts at index %lu and is %lu characters long",
//                  searchResult.location,        // 13
//                  searchResult.length);         // 6
//        }
        
        // Subdividing Strings
//        NSString *car = @"Maserati GranTurismo";
//        NSLog(@"%@", [car substringToIndex:8]);               // Maserati
//        NSLog(@"%@", [car substringFromIndex:9]);             // GranTurismo
//        NSRange range = NSMakeRange(9, 4);
//        NSLog(@"%@", [car substringWithRange:range]);         // Gran
//        
//        NSString *models = @"Porsche,Ferrari,Maserati";
//        NSArray *modelsAsArray = [models componentsSeparatedByString:@","];
//        NSLog(@"%@", [modelsAsArray objectAtIndex:1]);        // Ferrari
        
        // Replacing Strings
//        NSString *elise = @"Lotus Elise";
//        NSRange range = NSMakeRange(6, 5);
//        NSString *exige = [elise stringByReplacingCharactersInRange:range
//                                                         withString:@"Exige"];
//        NSLog(@"%@", exige);          // Lotus Exige
//        NSString *evora = [exige stringByReplacingOccurrencesOfString:@"Exige"
//                                                           withString:@"Evora"];
//        NSLog(@"%@", evora);          // Lotus Evora
        
        // Changing Case
//        NSString *car = @"lotUs beSpoKE";
//        NSLog(@"%@", [car lowercaseString]);      // lotus bespoke
//        NSLog(@"%@", [car uppercaseString]);      // LOTUS BESPOKE
//        NSLog(@"%@", [car capitalizedString]);    // Lotus Bespoke
        
        // Numberical Conversions
//        NSString *year = @"2012";
//        BOOL asBool = [year boolValue];
//        int asInt = [year intValue];
//        NSInteger asInteger = [year integerValue];
//        long long asLongLong = [year longLongValue];
//        float asFloat = [year floatValue];
//        double asDouble = [year doubleValue];
        
        // Creating NSMutableString
//        NSMutableString *car = [NSMutableString stringWithString:@"Porsche 911"];
//        [car setString:@"Porsche Boxster"];
        
        // Expanding Mutable Strings
//        NSMutableString *car = [NSMutableString stringWithCapacity:20];
//        NSString *model = @"458 Spider";
//        
//        [car setString:@"Ferrari"];
//        [car appendString:model];
//        NSLog(@"%@", car);                    // Ferrari458 Spider
//        
//        [car setString:@"Ferrari"];
//        [car appendFormat:@" %@", model];
//        NSLog(@"%@", car);                    // Ferrari 458 Spider
//        
//        [car setString:@"Ferrari Spider"];
//        [car insertString:@"458 " atIndex:8];
//        NSLog(@"%@", car);                    // Ferrari 458 Spider
        
        // Replacing/Deleting Substrings
//        NSMutableString *car = [NSMutableString stringWithCapacity:20];
//        [car setString:@"Lotus Elise"];
//        [car replaceCharactersInRange:NSMakeRange(6, 5)
//                           withString:@"Exige"];
//        NSLog(@"%@", car);                               // Lotus Exige
//        [car deleteCharactersInRange:NSMakeRange(5, 6)];
//        NSLog(@"%@", car);                               // Lotus
        
        // DO NOT DO THIS. EVER.
//        NSString *indices = @"";
//        for (int i=0; i<1000; i++) {
//            indices = [indices stringByAppendingFormat:@"%d", i];
//        }
        
        // Solution
        NSMutableString *indices = [NSMutableString stringWithCapacity:1];
        for (int i=0; i<1000; i++)
        {
            [indices appendFormat:@"%d", i];
        }
        
    }
    return 0;
}

