//
//  IDDRightContentViewController.h
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDDMonsterSelectionDelegate.h"
#import "IDDColorPickerDelegate.h"
#import "IDDColorPickerViewController.h"
#import "IDDWeaponSelectorImageView.h" 

// Also has IDDWeaponSelectorDelegate protocol

@class IDDMonster;

@interface IDDRightContentViewController : UIViewController<UISplitViewControllerDelegate, IDDMonsterSelectionDelegate, IDDColorPickerDelegate, IDDWeaponSelectorDelegate>

@property (nonatomic, strong) IDDMonster *monster;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet IDDWeaponSelectorImageView *weaponImageView; // Change to the custom image selector view

@property (weak, nonatomic) IBOutlet UINavigationItem *navBarItem;

@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, strong) IDDColorPickerViewController *colorPicker;
@property (nonatomic, strong) UIPopoverController *colorPickerPopover;

- (IBAction)chooseColorButtonTapped:(id)sender;

@end
