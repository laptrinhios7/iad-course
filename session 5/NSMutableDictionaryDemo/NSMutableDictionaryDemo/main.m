//
//  main.m
//  NSMutableDictionaryDemo
//
//  Created by Vu Tran Lam on 3/17/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Creating mutable dictionary
//        NSMutableDictionary *jobs = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                                    @"Audi TT" : @"John",
//                                                                                    @"Audi Quattro (Black)" : @"Mary",
//                                                                                    @"Audi Quattro (Silver)" : @"Bill",
//                                                                                    @"Audi A7" : @"Bill"
//                                                                                    }];
//        NSLog(@"%@", jobs);
        
        // Adding and removing entries
//        NSMutableDictionary *jobs = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                                    @"Audi TT" : @"John",
//                                                                                    @"Audi Quattro (Black)" : @"Mary",
//                                                                                    @"Audi Quattro (Silver)" : @"Bill",
//                                                                                    @"Audi A7" : @"Bill"
//                                                                                    }];
//        // Transfer an existing job to Mary
//        [jobs setObject:@"Mary" forKey:@"Audi TT"];
//        // Finish a job
//        [jobs removeObjectForKey:@"Audi A7"];
//        // Add a new job
//        jobs[@"Audi R8 GT"] = @"Jack";
        
        // Combining dictionaries
//        NSMutableDictionary *jobs = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                                    @"Audi TT" : @"John",
//                                                                                    @"Audi Quattro (Black)" : @"Mary",
//                                                                                    @"Audi Quattro (Silver)" : @"Bill",
//                                                                                    @"Audi A7" : @"Bill"
//                                                                                    }];
//        NSDictionary *bakerStreetJobs = @{
//                                          @"BMW 640i" : @"Dick",
//                                          @"BMW X5" : @"Brad"
//                                          };
//        [jobs addEntriesFromDictionary:bakerStreetJobs];
        
        // Create an empty mutable dictionary
NSMutableDictionary *jobs = [NSMutableDictionary dictionary];
// Populate it with initial key-value pairs
[jobs addEntriesFromDictionary:@{
                                 @"Audi TT" : @"John",
                                 @"Audi Quattro (Black)" : @"Mary",
                                 @"Audi Quattro (Silver)" : @"Bill",
                                 @"Audi A7" : @"Bill"
                                 }];

    }
    return 0;
}

