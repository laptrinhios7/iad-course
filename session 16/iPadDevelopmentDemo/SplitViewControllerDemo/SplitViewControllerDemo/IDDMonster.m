//
//  IDDMonster.m
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDMonster.h"

@implementation IDDMonster


+ (IDDMonster *)newMonsterWithName:(NSString *)name description:(NSString *)description icon:(NSString *)icon weapon:(Weapon)weapon
{
    IDDMonster *monster = [[IDDMonster alloc]init];
    monster.name = name;
    monster.description = description;
    monster.icon = icon;
    monster.weapon = weapon;
    return monster;
}

- (UIImage *)weaponImage
{
    switch (self.weapon)
    {
        case Blowgun :
            return [UIImage imageNamed:@"blowgun.png"];
            break;
        case NinjaStar:
            return [UIImage imageNamed:@"ninjastar.png"];
            break;
        case Fire:
            return [UIImage imageNamed:@"fire.png"];
            break;
        case Sword:
            return [UIImage imageNamed:@"sword.png"];
            break;
        case Smoke:
            return [UIImage imageNamed:@"smoke.png"];
            break;
        default:
            break;
    }
}

@end
