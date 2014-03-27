//
//  IDDLeftTableViewController.h
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Monster;

#import "IDDMonsterSelectionDelegate.h"

@interface IDDLeftTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *monsters;
@property (nonatomic, assign) id<IDDMonsterSelectionDelegate> delegate;

@end
