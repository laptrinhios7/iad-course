//
//  Metropolis.m
//  MetropolisDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import "Metropolis.h"
#import "City.h"

@implementation Metropolis

- (id)init
{
    self = [super init];
    if (self)
    {
        City *city1 = [[City alloc]init];
        City *city2 = [[City alloc]init];
        City *city3 = [[City alloc]init];
        City *city4 = [[City alloc]init];
        City *city5 = [[City alloc]init];
        City *city6 = [[City alloc]init];
        City *city7 = [[City alloc]init];
        City *city8 = [[City alloc]init];
        City *city9 = [[City alloc]init];
        City *city10 = [[City alloc]init];
        
        _cities = [NSArray arrayWithObjects:city1, city2, city3, city4, city5, city6, city7, city8, city9, city10, nil];
    }
    return self;
}

- (void)createCity:(NSString *)name atIndex:(int)atIndex withPopulation:(long)withPopulation
{
    City *city = [[City alloc]init];
    city = [_cities objectAtIndex:atIndex];
    [city setName:name];
    [city setPopulation:withPopulation];
}

- (void)displayCity:(int)atIndex
{
    NSLog(@"City name: %@", [[_cities objectAtIndex:atIndex]getName]);
    NSLog(@"City population: %ld", [[_cities objectAtIndex:atIndex]getPopulation]);
}

@end
