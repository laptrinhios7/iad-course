//
//  TMDProductsViewController.h
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/23/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMDProductsViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic) NSMutableArray *products;

@property (nonatomic, strong) NSMutableArray *categories;

@end
