//
//  TMDCategoriesViewController.m
//  TableManipulationDemo-Final
//
//  Created by Vu Tran Lam on 10/27/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDCategoriesViewController.h"



@interface TMDCategoriesViewController ()

@end

@implementation TMDCategoriesViewController

@synthesize delegate;
//@synthesize categogries;

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
    
    // Access categoryArray in NSUserDefaults from anywhere in project
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.categories = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"categoryArray"]];
    
    self.navigationItem.rightBarButtonItem = self.addNewButton;
    
    NSLog(@"Count: %d", [self.categories count]);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return number of categories
    return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellID = @"CellIdentifier";
    
    // dequeue a cell from self's table view
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellID];
    
    // Configure the cell...
    cell.textLabel.text = [[self.categories objectAtIndex:indexPath.row] description];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(selectCategory:category:)]) {
        [self.delegate selectCategory:self category:[[self.categories objectAtIndex:indexPath.row] description]];
    }
}



#pragma mark - UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    // Add category alertView
    if (buttonIndex == 1)
    {
        NSString *categoryName = [[alertView textFieldAtIndex:0] text];
        [self.categories addObject:categoryName];
        
        // Update the new category in NSUserdefaults
        [[NSUserDefaults standardUserDefaults] setObject:self.categories forKey:@"categoryArray"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        /*NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];*/
        [self.tableView reloadData];
    }
}


- (IBAction)addNewAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add Category" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *alertTextField = [alertView textFieldAtIndex:0];
    [alertTextField setPlaceholder:@"Category Name"];
    [alertView show];

}
- (IBAction)cancelAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
