//
//  Metropolis.h
//  MetropolisDemo
//
//  Created by Vu Tran Lam on 3/16/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Metropolis : NSObject

@property (nonatomic) NSArray *cities;

- (void)createCity:(NSString *)name atIndex:(int)atIndex withPopulation:(long)withPopulation;
- (void)displayCity:(int)atIndex;

@end
