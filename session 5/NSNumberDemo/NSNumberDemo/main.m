//
//  main.m
//  NSNumberDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
//        NSNumber *aBool = [NSNumber numberWithBool:NO];
//        NSNumber *aChar = [NSNumber numberWithChar:'z'];
//        NSNumber *aUChar = [NSNumber numberWithUnsignedChar:255];
//        NSNumber *aShort = [NSNumber numberWithShort:32767];
//        NSNumber *aUShort = [NSNumber numberWithUnsignedShort:65535];
//        NSNumber *anInt = [NSNumber numberWithInt:2147483647];
//        NSNumber *aUInt = [NSNumber numberWithUnsignedInt:4294967295];
//        NSNumber *aLong = [NSNumber numberWithLong:9223372036854775807];
//        NSNumber *aULong = [NSNumber numberWithUnsignedLong:18446744073709551615];
//        NSNumber *aFloat = [NSNumber numberWithFloat:26.99f];
//        NSNumber *aDouble = [NSNumber numberWithDouble:26.99];
//        
//        NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
//        NSLog(@"%c", [aChar charValue]);
//        NSLog(@"%hhu", [aUChar unsignedCharValue]);
//        NSLog(@"%hi", [aShort shortValue]);
//        NSLog(@"%hu", [aUShort unsignedShortValue]);
//        NSLog(@"%i", [anInt intValue]);
//        NSLog(@"%u", [aUInt unsignedIntValue]);
//        NSLog(@"%li", [aLong longValue]);
//        NSLog(@"%lu", [aULong unsignedLongValue]);
//        NSLog(@"%f", [aFloat floatValue]);
//        NSLog(@"%f", [aDouble doubleValue]);
        
//        NSNumber *anInt = [NSNumber numberWithInt:42];
//        float asFloat = [anInt floatValue];
//        NSLog(@"%.2f", asFloat);
//        NSString *asString = [anInt stringValue];
//        NSLog(@"%@", asString);
        
//        NSNumber *aUChar = [NSNumber numberWithUnsignedChar:255];
//        NSNumber *anInt = [NSNumber numberWithInt:2147483647];
//        NSNumber *aFloat = [NSNumber numberWithFloat:26.99f];
//        NSLog(@"%@", aUChar);
//        NSLog(@"%@", anInt);
//        NSLog(@"%@", aFloat);
        
//        double x = 24.0;
//        NSNumber *result = @(x * .15);
//        NSLog(@"%.2f", [result doubleValue]);
        
//        NSNumber *counter = @0;
//        for (int i=0; i<10; i++) {
//            counter = @([counter intValue] + 1);
//            NSLog(@"%@", counter);
//        }
        
//        NSNumber *anInt = @27;
//        NSNumber *sameInt = @27U;
//        // Pointer comparison (fails)
//        if (anInt == sameInt) {
//            NSLog(@"They are the same object");
//        }
//        // Value comparison (succeeds)
//        if ([anInt isEqualToNumber:sameInt]) {
//            NSLog(@"They are the same value");
//        }
        
        NSNumber *anInt = @27;
        NSNumber *anotherInt = @42;
        NSComparisonResult result = [anInt compare:anotherInt];
        if (result == NSOrderedAscending) {
            NSLog(@"27 < 42");
        } else if (result == NSOrderedSame) {
            NSLog(@"27 == 42");
        } else if (result == NSOrderedDescending) {
            NSLog(@"27 > 42");
        }

    }
    return 0;
}

