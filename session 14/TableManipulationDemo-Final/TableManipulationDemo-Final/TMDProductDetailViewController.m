//
//  TMDProductDetailViewController.m
//  TableManipulationDemo-Final
//
//  Created by Vu Tran Lam on 10/28/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProductDetailViewController.h"

@interface TMDProductDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *productNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *productCategoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *productYearLabel;
@property (strong, nonatomic) IBOutlet UILabel *productPriceLabel;

@end

@implementation TMDProductDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.productCategoryLabel.text = self.productCategory;
    self.productYearLabel.text = self.productYear;
    self.productPriceLabel.text = self.productPrice;
    
    // Change the tite of back bar button item
    self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
}


// Change the height of Header and Footer Table Section
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 35.0f;
    }
    return 25.0f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}



@end
