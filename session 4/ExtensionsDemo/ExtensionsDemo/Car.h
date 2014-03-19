//
//  Car.h
//  CategoriesDemo
//
//  Created by Vu Tran Lam on 3/15/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.h
#import <Foundation/Foundation.h>
#import "Person.h"

@interface Car : NSObject

@property (readonly) Person *driver;

@property (copy) NSString *model;
@property (readwrite) double odometer;

- (id)initWithDriver:(Person *)driver;

- (void)startEngine;
- (void)drive;
- (void)turnLeft;
- (void)turnRight;

- (BOOL)engineIsWorking;

@end