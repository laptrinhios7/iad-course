//
//  IDDRightContentViewController.m
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDRightContentViewController.h"
#import "IDDMonster.h"


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
    _weaponImageView.image = [_monster weaponImage];
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

@end
