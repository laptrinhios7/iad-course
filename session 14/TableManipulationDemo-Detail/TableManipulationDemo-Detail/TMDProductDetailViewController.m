//
//  TMDProductDetailViewController.m
//  TableManipulationDemo-Detail
//
//  Created by Vu Tran Lam on 10/25/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProductDetailViewController.h"

@interface TMDProductDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *productInfoLabel;

@end

@implementation TMDProductDetailViewController

static NSString *ProductTitleKey = @"ProductTitleKey";
static NSString *ProductInfoKey = @"ProductInfoKey";

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.productInfoLabel.text = self.productInfo;
    
}

/*- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    
    [coder encodeObject:self.title forKey:ProductTitleKey];
    [coder encodeObject:self.productInfoLabel.text forKey:ProductTitleKey];
    
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    
    self.title = [coder decodeObjectForKey:ProductTitleKey];
    self.productInfo = [coder decodeObjectForKey:ProductInfoKey];
}*/

@end
