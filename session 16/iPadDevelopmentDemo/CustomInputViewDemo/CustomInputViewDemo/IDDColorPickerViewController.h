//
//  IDDColorPickerViewController.h
//  PopoverControllerDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDDColorPickerDelegate.h"

@interface IDDColorPickerViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *colorNames;
@property (nonatomic, weak) id<IDDColorPickerDelegate> delegate;

@end
