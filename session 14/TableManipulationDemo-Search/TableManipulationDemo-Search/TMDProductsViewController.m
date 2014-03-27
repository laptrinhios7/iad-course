//
//  TMDProductsViewController.m
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/23/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProductsViewController.h"
#import "TMDProduct.h"

@interface TMDProductsViewController()

// Ther searchResults array contains the content filterd as a result of a search
@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation TMDProductsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a mutable array to contain products for the results table
    self.searchResults = [NSMutableArray arrayWithCapacity:[self.products count]];
    
    // Set up the search scope buttons with titles using product's localized display name
    NSMutableArray *scopeButtonTitles = [[NSMutableArray alloc] init];
    [scopeButtonTitles addObject:NSLocalizedString(@"All", @"Title for the All button in the search display controller")];
    
    for (NSString *deviceType in [TMDProduct deviceTypeNames])
    {
        NSString *displayName = [TMDProduct displayNameForType:deviceType];
        [scopeButtonTitles addObject:displayName];
    }
    
    self.searchDisplayController.searchBar.scopeButtonTitles = scopeButtonTitles;
    
    

}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// If the requesting table view is the search display controller's table view, return the count of the filtered list, otherwise return the count of the main list
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.searchResults count];
    }
    else
    {
        return [self.products count];
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"CellIdentifier";
    
    // Dequeue a cell from self's table view
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellID];
    
    // If the requesting table view is the search display controller's table view, configure the cell using the search results array otherwise use the product array
	TMDProduct *product;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        product = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        product = [self.products objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = product.name;
    
    // build the price and year string
    //
    // use NSNumberFormatter to get the currency format out of this NSNumber (product.introPrice)
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *priceString = [numFormatter stringFromNumber:product.introPrice];
    
    NSString *detailedString = [NSString stringWithFormat:@"%@ | %@", priceString, [product.yearIntroduced stringValue]];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:detailedString];
    // make the vertical separator line light gray
    NSRange foundRange = [detailedString rangeOfString:@"|"];
    [attributeString addAttribute:NSForegroundColorAttributeName
                      value:[UIColor lightGrayColor]
                      range:NSMakeRange(foundRange.location, 1)];
    cell.detailTextLabel.attributedText = attributeString;
    
	return cell;
}

#pragma mark - Content Filtering

- (void)updateFilteredContentForProductName:(NSString *)productName type:(NSString *)typeName
{
    // Update the filtered array based on the search text and scope
    if ((productName == nil) || ([productName length] == 0))
    {
        // If there is no search string and the scope is "All"
        if (typeName == nil)
        {
            self.searchResults = [self.products mutableCopy];
        }
        else
        {
            // If there is no search string and the scope is chosen
            NSMutableArray *searchResults = [[NSMutableArray alloc] init];
            for (TMDProduct *product in self.products)
            {
                if ([product.type isEqualToString:typeName])
                {
                    [searchResults addObject:product];
                }
            }
            self.searchResults = searchResults;
        }
        return;
    }
    
    // First clear the filtered array
    [self.searchResults removeAllObjects];
    
    // Search the main list for products whose type matches the scope (if selected) and whose name match searchText; and add the item that match to the filtered array
    for (TMDProduct *product in self.products)
    {
        if ((typeName == nil) || ([product.type isEqualToString:typeName]))
        {
            NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
            NSRange productNameRange = NSMakeRange(0, product.name.length);
            NSRange foundRange = [product.name rangeOfString:productName options:searchOptions range:productNameRange];
            if (foundRange.length > 0)
            {
                [self.searchResults addObject:product];
            }
        }
    }
    
}

#pragma mark - UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSString *scope;
    
    NSInteger selectedScopeButtonIndex = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
    if (selectedScopeButtonIndex > 0)
    {
        scope = [[TMDProduct deviceTypeNames] objectAtIndex:(selectedScopeButtonIndex - 1)];
    }
    
    [self updateFilteredContentForProductName:searchString type:scope];
    // Return YES to cause the search result table view to be reloaded
    return YES;
    
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString *searchString = [self.searchDisplayController.searchBar text];
    NSString *scope;
    
    if (searchOption > 0)
    {
        scope = [[TMDProduct deviceTypeNames] objectAtIndex:(searchOption - 1)];
        
    }
    [self updateFilteredContentForProductName:searchString type:scope];
    
    // Return YES to cause the search result table view to be reloaded
    return YES;
}




@end
