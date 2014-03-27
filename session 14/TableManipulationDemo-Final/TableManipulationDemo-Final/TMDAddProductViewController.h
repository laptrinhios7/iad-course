//
//  TMDAddProductViewController.h
//  TableManipulationDemo-Action
//
//  Created by Vu Tran Lam on 10/26/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDCategoriesViewController.h"

@protocol AddProductViewControllerDelegate;

@interface TMDAddProductViewController : UITableViewController  <UITextFieldDelegate, CategoriesViewControllerDelegate>

@property (weak, nonatomic) id <AddProductViewControllerDelegate> delegate;

- (IBAction)doneAction:(id)sender;
- (IBAction)cancelAction:(id)sender;

@end

@protocol AddProductViewControllerDelegate <NSObject>

- (void)addProductViewControllerDidFinish:(TMDAddProductViewController *)controller name:(NSString *)name category:(NSString *)category year:(NSNumber *)year price:(NSNumber *)price;

@end