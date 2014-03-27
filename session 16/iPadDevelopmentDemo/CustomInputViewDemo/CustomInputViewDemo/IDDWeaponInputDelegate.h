//
//  IDDWeaponInputDelegate.h
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDDWeapon.h" // Provide to access the WeaponType enum

@protocol IDDWeaponInputDelegate <NSObject>

@required
- (void)selectedWeaponType:(WeaponType)weaponType;
- (void)closeTapped;

@end
