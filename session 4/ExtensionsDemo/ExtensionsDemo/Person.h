//
//  Person.h
//  ExtensionsDemo
//
//  Created by Vu Tran Lam on 3/19/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

// Person.h

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy) NSString* name;

- (void)sayHello;
- (void)sayGoodbye;

@end
