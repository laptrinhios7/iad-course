//
//  IDDMonster.m
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDMonster.h"
#import "IDDWeapon.h"

@implementation IDDMonster


+ (IDDMonster *)newMonsterWithName:(NSString *)name description:(NSString *)description icon:(NSString *)icon weapon:(IDDWeapon *)weapon
{
    IDDMonster *monster = [[IDDMonster alloc]init];
    monster.name = name;
    monster.description = description;
    monster.icon = icon;
    monster.weapon = weapon;
    return monster;
}


@end
