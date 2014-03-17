//
//  City.h
//  MetropolisDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (getter = getName, nonatomic) NSString *name;
@property (getter = getAge, nonatomic) int age;
@property (getter = getPopulation, nonatomic) long population;

- (void)nextDay;

@end
