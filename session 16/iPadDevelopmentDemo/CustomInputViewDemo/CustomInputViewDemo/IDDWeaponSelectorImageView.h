//
//  IDDWeaponSelectorImageView.h
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDDWeaponInputViewController.h"
#import "IDDWeaponSelectorDelegate.h"

@interface IDDWeaponSelectorImageView : UIImageView<IDDWeaponInputDelegate>

@property (nonatomic, strong) IDDWeapon *weapon;
@property (nonatomic, strong) IDDWeaponInputViewController *weaponInputController;
@property (nonatomic, strong) IBOutlet id<IDDWeaponSelectorDelegate> delegate;

@end
