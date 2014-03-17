//
//  BetterMetropolis.m
//  MetropolisDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import "BetterMetropolis.h"

@implementation BetterMetropolis

- (void)displayAllCities
{
    for (int i = 0; i < 10; i++)
    {
        City *city = [[City alloc]init];
        city = [self.cities objectAtIndex:i];
        [city nextDay];
        [self displayCity:i];
    }
}

@end
