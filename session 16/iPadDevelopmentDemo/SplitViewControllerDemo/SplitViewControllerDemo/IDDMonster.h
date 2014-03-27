//
//  IDDMonster.h
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    Blowgun = 0,
    NinjaStar,
    Fire,
    Sword,
    Smoke
}Weapon;

@interface IDDMonster : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) Weapon weapon;

// Factory class method to create new Monster
+ (IDDMonster *)newMonsterWithName:(NSString *)name description:(NSString *)description icon:(NSString *)icon weapon:(Weapon)weapon;

// Get the UIImage to represent the monster's weapon
- (UIImage *)weaponImage;

@end
