//
//  Car.h
//  CarDemo
//
//  Created by Vu Tran Lam on 3/11/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Car.h

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Car : NSObject

//@property (copy) NSString *model;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, strong) Person *driver;

//@property (getter = isRunning) BOOL running;
@property (getter = isRunning, readonly) BOOL running;

// Declare the contructor
- (id)initWithModel:(NSString *)aModel;

// Decalare class method
+ (void) setDefaultModel:(NSString *)aModel;

- (void)drive;

- (void)startEngine;
- (void)stopEngine;

@end
