//
//  BookTableViewController.h
//  CoreDataDemo-Part1
//
//  Created by Vu Tran Lam on 6/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *books;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
