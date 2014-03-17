//
//  City.m
//  MetropolisDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import "City.h"

@implementation City

- (void)nextDay
{
    long currentPopulation = [self getPopulation];
    int addingPopulation = getRandomInteger(1, 100);
    int subtractingPopulation  = getRandomInteger(1, 100);
    
    [self setPopulation:currentPopulation + (long)addingPopulation - (long)subtractingPopulation];
}

int getRandomInteger(int minimum, int maximum)
{
    int randomInt = arc4random_uniform((maximum - minimum) + 1) + minimum;
    return randomInt;
}

@end
