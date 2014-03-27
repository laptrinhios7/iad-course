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

@class IDDMonster;

@interface IDDRightContentViewController : UIViewController<UISplitViewControllerDelegate, IDDMonsterSelectionDelegate, IDDColorPickerDelegate>

@property (nonatomic, strong) IDDMonster *monster;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *weaponImageView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBarItem;

@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, strong) IDDColorPickerViewController *colorPicker;
@property (nonatomic, strong) UIPopoverController *colorPickerPopover;

- (IBAction)chooseColorButtonTapped:(id)sender;

@end
