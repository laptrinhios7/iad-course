//
//  TMDCategoriesViewController.h
//  TableManipulationDemo-Final
//
//  Created by Vu Tran Lam on 10/27/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoriesViewControllerDelegate;

@interface TMDCategoriesViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *categories;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addNewButton;

@property (nonatomic, assign) id<CategoriesViewControllerDelegate> delegate;


- (IBAction)cancelAction:(id)sender;

- (IBAction)addNewAction:(id)sender;

@end

@protocol CategoriesViewControllerDelegate <NSObject>

- (void)selectCategory:(TMDCategoriesViewController *)controller category:(NSString *)category;

@end
