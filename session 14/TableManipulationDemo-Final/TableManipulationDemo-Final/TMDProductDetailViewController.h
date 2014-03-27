//
//  TMDProductDetailViewController.h
//  TableManipulationDemo-Final
//
//  Created by Vu Tran Lam on 10/28/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMDProductDetailViewController : UITableViewController
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *productCategory;
@property (nonatomic, copy) NSString *productYear;
@property (nonatomic, copy) NSString *productPrice;

@end
