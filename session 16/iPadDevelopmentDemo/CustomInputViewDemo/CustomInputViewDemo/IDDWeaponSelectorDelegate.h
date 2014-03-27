//
//  IDDWeaponSelectorDelegate.h
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDDWeapon;

@protocol IDDWeaponSelectorDelegate <NSObject>

- (void)selectedWeapon:(IDDWeapon *)weapon;

@end
