//
//  TBViewController.h
//  Session11-ToolbarDemo
//
//  Created by Vu Tran Lam on 10/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIPickerView *systemButtonPicker;
@property (strong, nonatomic) IBOutlet UISwitch *imageSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *tintColorSwitch;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;


@property (strong, nonatomic) IBOutlet UISegmentedControl *barStyleSegControl;

@end
