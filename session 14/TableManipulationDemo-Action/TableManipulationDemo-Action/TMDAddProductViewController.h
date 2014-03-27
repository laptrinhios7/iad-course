//
//  TMDAddProductViewController.h
//  TableManipulationDemo-Action
//
//  Created by Vu Tran Lam on 10/26/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddProductViewControllerDelegate;

@interface TMDAddProductViewController : UITableViewController  <UITextFieldDelegate>

@property (weak, nonatomic) id <AddProductViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end

@protocol AddProductViewControllerDelegate <NSObject>

- (void)addProductViewControllerDidFinish:(TMDAddProductViewController *)controller name:(NSString *)name type:(NSString *)type year:(NSNumber *)year price:(NSNumber *)price;

@end