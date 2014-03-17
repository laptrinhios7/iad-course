//
//  main.m
//  NSDecimalNumberDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSDecimalNumber *price;
//        price = [NSDecimalNumber decimalNumberWithMantissa:1599
//                                                  exponent:-2
//                                                isNegative:NO];
//        price = [NSDecimalNumber decimalNumberWithString:@"15.99"];
        
//        NSDecimalNumber *price1 = [NSDecimalNumber decimalNumberWithString:@"15.99"];
//        NSDecimalNumber *price2 = [NSDecimalNumber decimalNumberWithString:@"29.99"];
//        NSDecimalNumber *coupon = [NSDecimalNumber decimalNumberWithString:@"5.00"];
//        NSDecimalNumber *discount = [NSDecimalNumber decimalNumberWithString:@".90"];
//        NSDecimalNumber *numProducts = [NSDecimalNumber decimalNumberWithString:@"2.0"];
//        
//        NSDecimalNumber *subtotal = [price1 decimalNumberByAdding:price2];
//        NSDecimalNumber *afterCoupon = [subtotal decimalNumberBySubtracting:coupon];
//        NSDecimalNumber *afterDiscount = [afterCoupon decimalNumberByMultiplyingBy:discount];
//        NSDecimalNumber *average = [afterDiscount decimalNumberByDividingBy:numProducts];
//        NSDecimalNumber *averageSquared = [average decimalNumberByRaisingToPower:2];
//        
//        NSLog(@"Subtotal: %@", subtotal);                       // 45.98
//        NSLog(@"After coupon: %@", afterCoupon);                // 40.98
//        NSLog((@"After discount: %@"), afterDiscount);          // 36.882
//        NSLog(@"Average price per product: %@", average);       // 18.441
//        NSLog(@"Average price squared: %@", averageSquared);    // 340.070481
        
//        NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
//                                           decimalNumberHandlerWithRoundingMode:NSRoundUp
//                                           scale:2
//                                           raiseOnExactness:NO
//                                           raiseOnOverflow:NO
//                                           raiseOnUnderflow:NO
//                                           raiseOnDivideByZero:YES];
//
//        NSDecimalNumber *subtotal = [NSDecimalNumber decimalNumberWithString:@"40.98"];
//        NSDecimalNumber *discount = [NSDecimalNumber decimalNumberWithString:@".90"];
//        
//        NSDecimalNumber *total = [subtotal decimalNumberByMultiplyingBy:discount
//                                                           withBehavior:roundUp];
//        NSLog(@"Rounded total: %@", total);

        NSDecimalNumber *discount1 = [NSDecimalNumber decimalNumberWithString:@".85"];
        NSDecimalNumber *discount2 = [NSDecimalNumber decimalNumberWithString:@".9"];
        NSComparisonResult result = [discount1 compare:discount2];
        if (result == NSOrderedAscending)
        {
            NSLog(@"85%% < 90%%");
        }
        else if (result == NSOrderedSame)
        {
            NSLog(@"85%% == 90%%");
        }
        else if (result == NSOrderedDescending)
        {
            NSLog(@"85%% > 90%%");
        }
    }
    return 0;
}

