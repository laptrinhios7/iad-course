//
//  IDDWeaponInputViewController.h
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDDWeaponInputDelegate.h"

@interface IDDWeaponInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *blowgunButton;
@property (weak, nonatomic) IBOutlet UIButton *fireButton;
@property (weak, nonatomic) IBOutlet UIButton *ninjaStarButton;
@property (weak, nonatomic) IBOutlet UIButton *smokeButton;
@property (weak, nonatomic) IBOutlet UIButton *swordButton;

@property (nonatomic,weak) id<IDDWeaponInputDelegate> delegate;

- (IBAction)weaponButtonTapped:(UIButton *)sender;
- (IBAction)closeTapped:(id)sender;

@end
