//
//  IDDWeaponInputViewController.m
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDWeaponInputViewController.h"

@interface IDDWeaponInputViewController ()

@end

@implementation IDDWeaponInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)weaponButtonTapped:(UIButton *)sender
{
    // Create a variable to hold the selected weapon type
    WeaponType selectedWeaponType;
    
    // Set the selected weapon based on the button that was presented
    if (sender == _blowgunButton)
    {
        selectedWeaponType = Blowgun;
    }
    else if (sender == _fireButton)
    {
        selectedWeaponType = Fire;
    }
    else if (sender == _ninjaStarButton)
    {
        selectedWeaponType = NinjaStar;
    }
    else if (sender == _smokeButton)
    {
        selectedWeaponType = Smoke;
    }
    else if (sender == _swordButton)
    {
        selectedWeaponType = Sword;
    }
    else
    {
        NSLog(@"Invalid Button");
    }
    
    // Notify the delegate of selection if it exists
    if (_delegate != nil)
    {
        [_delegate selectedWeaponType:selectedWeaponType];
    }
        
}

- (IBAction)closeTapped:(id)sender
{
    // Notify the delegate if it exists
    if (_delegate != nil)
    {
        [_delegate closeTapped];
    }
    
}

@end
