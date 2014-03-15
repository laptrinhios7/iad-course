//
//  Person.h
//  CarDemo
//
//  Created by Vu Tran Lam on 3/14/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Person.h

#import <Foundation/Foundation.h>

@class Car;

@interface Person : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic, weak) Car *car;

@end
