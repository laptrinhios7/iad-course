//
//  main.m
//  MetropolisDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "Metropolis.h"
#import "BetterMetropolis.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        /*City *city = [[City alloc]init];
        [city setName:@"Hanoi"];
        [city setAge:100];
        [city setPopulation:1000000];
        
        NSLog(@"City name: %@", [city getName]);
        NSLog(@"City age: %d", [city getAge]);
        NSLog(@"City population: %ld", [city getPopulation]);
        
        for (int i = 0; i < 10; i++)
        {
            [city nextDay];
            NSLog(@"City population for next day %d: %ld", i + 1, [city getPopulation]);

        }*/
        
        /*Metropolis *myMetropolis = [[Metropolis alloc]init];
        long population = 1000000;
        for (int i = 0; i < 10; i++)
        {
            NSString *name = [NSString stringWithFormat:@"Hanoi %d", i + 1];
            [myMetropolis createCity:name atIndex:i withPopulation:population];
            population += 100000;
        }
        
        for (int i = 0; i < 10; i++)
        {
            //[myMetropolis displayCity:i];
            City *city = [[City alloc]init];
            city = [myMetropolis.cities objectAtIndex:i];
            [city nextDay];
            [myMetropolis displayCity:i];
        }*/
        
        BetterMetropolis *myBetterMetropolis = [[BetterMetropolis alloc]init];
        long population = 1000000;
        for (int i = 0; i < 10; i++)
        {
            NSString *name = [NSString stringWithFormat:@"Hanoi %d", i + 1];
            [myBetterMetropolis createCity:name atIndex:i withPopulation:population];
            population += 100000;
        }
        
        [myBetterMetropolis displayAllCities];
    }
    return 0;
}

