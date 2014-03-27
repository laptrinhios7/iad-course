//
//  IDDWeaponSelectorImageView.m
//  CustomInputViewDemo
//
//  Created by Vu Tran Lam on 12/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDWeaponSelectorImageView.h"

@implementation IDDWeaponSelectorImageView

#pragma mark - Override the setters
- (void)setWeapon:(IDDWeapon *)weapon
{
    // First make sure yor're actually changing the weapon
    if (_weapon != weapon)
    {
        _weapon = weapon;
        
        // Update your image to use the weapon's image
        self.image = [_weapon weaponImage];
    }
}

#pragma mark - Superclass overrides
- (BOOL)canBecomeFirstResponder
{
    // Say that this view can show an input view
    return YES;
}

- (UIView *)inputView
{
    // Make sure weaponInputController exists, and if not, create it
    if (_weaponInputController == nil)
    {
        //_weaponInputController = [[IDDWeaponInputViewController alloc] initWithNibName:nil bundle:nil];
        _weaponInputController = [[IDDWeaponInputViewController alloc]init];
        _weaponInputController.delegate = self;
    }
    
    // Return the IDDWeaponInputController's view as the input view
    return _weaponInputController.view;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Show the input view as soon as the imageViewis touched
    // if it is not already showing
    if (![self isFirstResponder])
    {
        [self becomeFirstResponder];
    }
}

#pragma mark - WeaponInputDelegate methods
- (void)closeTapped
{
    // Dismiss the input view
    [self resignFirstResponder];
}

- (void)selectedWeaponType:(WeaponType)weaponType
{
    // Set the instance variable
    [self setWeapon:[IDDWeapon newWeaponOfType:weaponType]];
    
    // Dismiss the input view
    [self resignFirstResponder];
    
    // Notify the delagte of the change if it exists
    if (_delegate != nil)
    {
        [_delegate selectedWeapon:_weapon];
    }
}

@end
