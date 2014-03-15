//
//  Car+Maintenance.m
//  CategoriesDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car+Maintenance.m

#import "Car+Maintenance.h"

@implementation Car (Maintenance)

- (BOOL)needsOilChange
{
    return YES;
}

- (void)changeOil
{
    NSLog(@"Changing oil for the %@", [self model]);
}

- (void)rotateTires
{
    NSLog(@"Rotating tires for the %@", [self model]);
}

- (void)jumpBatteryUsingCar:(Car *)anotherCar
{
    NSLog(@"Jumped the %@ with a %@", [self model], [anotherCar model]);
}

@end
