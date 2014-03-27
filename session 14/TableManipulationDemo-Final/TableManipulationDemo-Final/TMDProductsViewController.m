//
//  TMDProductsViewController.m
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/23/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProductsViewController.h"
#import "TMDAddProductViewController.h"
#import "TMDProductDetailViewController.h"
#import "TMDProduct.h"

@interface TMDProductsViewController() <AddProductViewControllerDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *deleteButton;

- (IBAction)editAction:(id)sender;
- (IBAction)cancelAction:(id)sender;
- (IBAction)deleteAction:(id)sender;

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
    
    // Access categoryArray in NSUserDefaults from anywhere in project
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.categories = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"categoryArray"]];
    
    for (NSString *deviceType in self.categories)
    {
        NSString *displayName = deviceType;
        [scopeButtonTitles addObject:displayName];
    }
    
    self.searchDisplayController.searchBar.scopeButtonTitles = scopeButtonTitles;
    self.tableView.allowsSelection = NO;
    
    // Make our view consitent
    [self updateButtonsToMatchTableState];
    
   

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Update the delete button's title based on how many items are selected.
    [self updateButtonsToMatchTableState];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"CellIdentifier";
    
    // dequeue a cell from self's table view
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellID];
    
    // If the requesting table view is the search display controller's table view, configure
    // the cell using the search results array, otherwise use the product array.
    
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

- (IBAction)editAction:(id)sender
{
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    [self.tableView setEditing:YES animated:YES];
    [self updateButtonsToMatchTableState];

}


- (IBAction)cancelAction:(id)sender
{
    self.tableView.allowsSelection = NO;
    
    [self.tableView setEditing:NO animated:YES];
    [self updateButtonsToMatchTableState];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // The user tapped one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        // Delete what the user selected
        NSArray *selectedRows = [self.tableView indexPathsForSelectedRows];
        BOOL deleteSpecificRows = selectedRows.count > 0;
        if (deleteSpecificRows)
        {
            // Build an NSIntegerSet of all objects to delete, so they can be removed at once
            NSMutableIndexSet *indicesOfItemsToDelete = [NSMutableIndexSet new];
            for (NSIndexPath *selectionIndex in selectedRows)
            {
                [indicesOfItemsToDelete addIndex:selectionIndex.row];
            }
            
            // Delete the objects from our data model
            [self.products removeObjectsAtIndexes:indicesOfItemsToDelete];
            
            // Tell the tableView that we deleted the objects
            [self.tableView deleteRowsAtIndexPaths:selectedRows withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        else
        {
            // Delete everything
            // Delete the objects from our data model
            [self.products removeAllObjects];
            
            // Tell the tableView that we deleted the objects
            // Because we are deleting all the rows, just reload the current table section
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}

- (IBAction)deleteAction:(id)sender
{
    // Open a diaglog with just an OK button
    NSString *actionTitle;
    if([[self.tableView indexPathsForSelectedRows] count] == 1)
    {
        actionTitle = NSLocalizedString(@"Are you sure you want to remove this product", @"");
    }
    else
    {
        actionTitle = NSLocalizedString(@"Are you sure you want to remove these products", @"");
    }
    
    NSString *cancelTitle = NSLocalizedString(@"Cancel", @"Cancel title for item removal action");
    NSString *okTitle = NSLocalizedString(@"OK", @"OK title for item removal action");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionTitle delegate:self
                                                    cancelButtonTitle:cancelTitle destructiveButtonTitle:okTitle otherButtonTitles:nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    // Show from our tableView (pops up in the middle of the table)
    [actionSheet showInView:self.view];
}


#pragma mark - Updating button state

- (void)updateButtonsToMatchTableState
{
    if (self.tableView.editing)
    {
        // Show the option to cancel the edit
        self.navigationItem.rightBarButtonItem = self.cancelButton;
        
        [self updateDeleteButtonTitle];
        
        // Show the delete button
        self.navigationItem.leftBarButtonItem = self.deleteButton;
        

    }
    else
    {
        // Not in editing mode
        self.navigationItem.leftBarButtonItem = self.addButton;
        
        // Show the edit button, but disable the edit button if there's nothing to edit
        if (self.products.count > 0)
        {
            self.editButton.enabled = YES;
        }
        self.navigationItem.rightBarButtonItem = self.editButton;
        self.tableView.allowsMultipleSelectionDuringEditing = NO;

        
    }
}

- (void)updateDeleteButtonTitle
{
    // Update the delete button's title, based on how many items are selected
    NSArray *selectedRows = [self.tableView indexPathsForSelectedRows];
    
    BOOL allItemsAreSelected = selectedRows.count == self.products.count;
    BOOL noItemsAreSelected = selectedRows.count == 0;
    
    if (allItemsAreSelected || noItemsAreSelected)
    {
        self.deleteButton.title = NSLocalizedString(@"Delete All", @"");
    }
    else
    {
        NSString *titleFormatString = NSLocalizedString(@"Delete (%d)", @"Title for delete button with placeholder for number");
        self.deleteButton.title = [NSString stringWithFormat:titleFormatString, selectedRows.count];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"])
    {
        TMDAddProductViewController *addController = (TMDAddProductViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"ShowDetailView"])
    {
    
        
        // Sender is the table view cell
        NSArray *sourceArray;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        sourceArray = self.products;
        
        // Prepare the detail view controller with new content
        TMDProductDetailViewController *destinationController = segue.destinationViewController;
        TMDProduct *product = sourceArray[indexPath.row];
        
        // Pass the price and year as a formatted string
        NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
        [numFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        NSString *priceString = [numFormatter stringFromNumber:product.introPrice];
        [numFormatter setNumberStyle:NSNumberFormatterNoStyle];
        NSString *yearString = [numFormatter stringFromNumber: product.yearIntroduced];
        
        //NSString *productInfo = [NSString stringWithFormat:@"%@ - %@", priceString, [product.yearIntroduced stringValue]];
        
        destinationController.title = product.name;
        destinationController.productCategory = product.category;
        destinationController.productYear = yearString;
        destinationController.productPrice = priceString;
       
        
    }

}

- (void)addProductViewControllerDidFinish:(TMDAddProductViewController *)controller name:(NSString *)name category:(NSString *)category year:(NSNumber *)year price:(NSNumber *)price
{
    if ([name length] || [category length])
    {
        // Add an product to the array
        TMDProduct *newProduct = [[TMDProduct alloc] init];
        newProduct.category = category;
        newProduct.name = name;
        newProduct.yearIntroduced = year;
        newProduct.introPrice = price;
        [self.products addObject:newProduct];

        [[self tableView] reloadData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
                if ([product.category isEqualToString:typeName])
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
        if ((typeName == nil) || ([product.category isEqualToString:typeName]))
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
        scope = [self.categories objectAtIndex:(selectedScopeButtonIndex - 1)];
    }
    
    [self updateFilteredContentForProductName:searchString type:scope];
    // Return YES to cause the search result tabe view to be reloaded
    return YES;
    
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString *searchString = [self.searchDisplayController.searchBar text];
    NSString *scope;
    
    if (searchOption > 0)
    {
        scope = [self.categories objectAtIndex:(searchOption - 1)];
        
    }
    [self updateFilteredContentForProductName:searchString type:scope];
    
    // Return YES to cause the search result table view to be reloaded
    return YES;
}


@end
