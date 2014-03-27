//
//  TMDProductsViewController.m
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/23/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProductsViewController.h"
#import "TMDProductDetailViewController.h"
#import "TMDProduct.h"

@interface TMDProductsViewController() <UIActionSheetDelegate>

@end

@implementation TMDProductsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    

}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// If the requesting table view is the search display controller's table view,
    // return the count of the filtered list, otherwise return the count of the main list/
    return [self.products count];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"CellIdentifier";
    
    // dequeue a cell from self's table view
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellID];
    
    // If the requesting table view is the search display controller's table view, configure
    // the cell using the search results array, otherwise use the product array.
    //
	TMDProduct *product;
    
	
    product = [self.products objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = product.name;
    
    // build the price and year string
    //
    // use NSNumberFormatter to get the currency format out of this NSNumber (product.introPrice)
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *priceStr = [numFormatter stringFromNumber:product.introPrice];
    
    NSString *detailedStr = [NSString stringWithFormat:@"%@ | %@", priceStr, [product.yearIntroduced stringValue]];
    NSMutableAttributedString *attribStr = [[NSMutableAttributedString alloc] initWithString:detailedStr];
    // make the vertical separator line light gray
    NSRange foundRange = [detailedStr rangeOfString:@"|"];
    [attribStr addAttribute:NSForegroundColorAttributeName
                      value:[UIColor lightGrayColor]
                      range:NSMakeRange(foundRange.location, 1)];
    cell.detailTextLabel.attributedText = attribStr;
    
	return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushDetailView"])
    {
        // Sender is the table view cell
        NSArray *sourceArray;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        sourceArray = self.products;
        
        // Prepare the detail view controller with new content
        TMDProductDetailViewController *destinationController = segue.destinationViewController;
        TMDProduct *product = sourceArray[indexPath.row];
        destinationController.title = product.name;
        
        // Pass the price and year as a formatted string
        NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
        [numFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        NSString *priceString = [numFormatter stringFromNumber:product.introPrice];
        NSString *productInfo = [NSString stringWithFormat:@"%@ - %@", priceString, [product.yearIntroduced stringValue]];
        
        destinationController.productInfo = productInfo;
        
    }
}

@end
