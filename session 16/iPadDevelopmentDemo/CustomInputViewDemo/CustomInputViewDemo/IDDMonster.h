//
//  IDDMonster.h
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDDWeapon;

@interface IDDMonster : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) IDDWeapon *weapon;

// Factory class method to create new Monster
+ (IDDMonster *)newMonsterWithName:(NSString *)name description:(NSString *)description icon:(NSString *)icon weapon:(IDDWeapon *)weapon;


@end
