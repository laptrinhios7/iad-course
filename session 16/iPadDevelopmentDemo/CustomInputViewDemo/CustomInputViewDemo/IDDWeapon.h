//
//  IDDWeapon.h
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
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
}WeaponType;

@interface IDDWeapon : NSObject

@property (nonatomic, assign) WeaponType weaponType;

// Factory method to make a new weapon object with a particular type
+ (IDDWeapon *)newWeaponOfType:(WeaponType)weaponType;

// Convenience instance method to get the UIImage representing the weapon
- (UIImage *)weaponImage;

@end
