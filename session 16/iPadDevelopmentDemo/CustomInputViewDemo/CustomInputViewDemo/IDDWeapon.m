//
//  IDDWeapon.m
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDWeapon.h"



@implementation IDDWeapon

+ (IDDWeapon *)newWeaponOfType:(WeaponType)weaponType
{
    IDDWeapon *weapon = [[IDDWeapon alloc]init];
    weapon.weaponType = weaponType;
    return weapon;
}

- (UIImage *)weaponImage
{
    switch (self.weaponType)
    {
        case Blowgun:
            return [UIImage imageNamed:@"blowgun.png"];
            break;
        case Fire:
            return [UIImage imageNamed:@"fire.png"];
            break;
        case NinjaStar:
            return [UIImage imageNamed:@"ninjastar.png"];
            break;
        case Sword:
            return [UIImage imageNamed:@"sword.png"];
            break;
        case Smoke:
            return [UIImage imageNamed:@"smoke.png"];
            break;
        default:
            return nil;
            break;
    }
}

@end
