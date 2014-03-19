//
//  Person.m
//  ExtensionsDemo
//
//  Created by Vu Tran Lam on 3/19/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Person.m

#import "Person.h"

@implementation Person

@synthesize name = _name;

- (void)sayHello
{
    NSLog(@"Hello, says %@.", _name);
}

- (void)sayGoodbye
{
    NSLog(@"Goodbye, says %@.", _name);
}

@end
