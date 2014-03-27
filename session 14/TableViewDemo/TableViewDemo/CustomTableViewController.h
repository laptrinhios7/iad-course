//
//  CustomTableViewController.h
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewController : UITableViewController

@property (nonatomic) NSArray *displayList;
@property (nonatomic) NSCalendar *calendar;

- (void)update:sender;


@end
