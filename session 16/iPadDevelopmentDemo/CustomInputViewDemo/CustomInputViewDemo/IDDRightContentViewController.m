//
//  IDDRightContentViewController.m
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDRightContentViewController.h"
#import "IDDMonster.h"
#import "IDDWeapon.h"

@implementation IDDRightContentViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Update the UI to reflect the monster set on initial load.
    [self refreshUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated, in this case the IBOutlets.
    [self setNameLabel:nil];
    [self setDescriptionLabel:nil];
    [self setIconImageView:nil];
    [self setWeaponImageView:nil];
}

- (void)setMonster:(IDDMonster *)monster
{
    // Maker sure you're not setting up the same monster
    if (_monster != monster)
    {
        _monster = monster;
        
        // Update the UI to reflect the new monster on the iPad
        [self refreshUI];
    }
}

- (void)selectedMonster:(IDDMonster *)monster
{
    [self setMonster:monster];
    
    // Dismiss the popover if it's showing
    if (_popover != nil)
    {
        [_popover dismissPopoverAnimated:YES];
    }
}

- (void)refreshUI
{
    _nameLabel.text = _monster.name;
    _descriptionLabel.text = _monster.description;
    _iconImageView.image = [UIImage imageNamed:_monster.icon];
    
    // Setting the weapon on your custom imageview will automatically set the image
    _weaponImageView.weapon = _monster.weapon;
}

#pragma mark - UISplitViewDelegate methods
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    // Grab a reference to the popover
    self.popover = pc;
    
    // Set the title of the bar button item
    barButtonItem.title = @"Monsters";
    
    // Set the bar button item as the left NavBarButtonItem
    [_navBarItem setLeftBarButtonItem:barButtonItem animated:YES];
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Remove the barButtonItem
    [_navBarItem setLeftBarButtonItem:nil animated:YES];
    
    // Nil out the pointer to popover
    _popover = nil;
}

- (IBAction)chooseColorButtonTapped:(id)sender
{
    if (_colorPicker == nil)
    {
        _colorPicker = [[IDDColorPickerViewController alloc]initWithStyle:UITableViewStylePlain];
        _colorPicker.delegate = self;
    }
    
    if (_colorPickerPopover == nil)
    {
        // Show the color popover
        _colorPickerPopover = [[UIPopoverController alloc]initWithContentViewController:_colorPicker];
        [_colorPickerPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *)sender permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
    }
    else
    {
        // Hide the color popover
        [_colorPickerPopover dismissPopoverAnimated:YES];
        _colorPickerPopover =nil;
    }
}


#pragma mark IDDColorPickerDelegate
- (void)selectedColor:(UIColor *)newColor
{
    _nameLabel.textColor = newColor;
    
    if (_colorPickerPopover)
    {
        [_colorPickerPopover dismissPopoverAnimated:YES];
        _colorPickerPopover = nil;
    }
}

#pragma mark - IDDWeaponSelectorDelegate method
- (void)selectedWeapon:(IDDWeapon *)weapon
{
    // Check to make sure the weapon is changing
    if (_monster.weapon != weapon)
    {
        // Update the weapon
        _monster.weapon = weapon;
    }
}

@end
