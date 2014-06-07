//
//  BookTableViewController.m
//  CoreDataDemo-Part2
//
//  Created by Vu Tran Lam on 6/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import "BookTableViewController.h"

@interface BookTableViewController ()

@end

@implementation BookTableViewController

@synthesize books;
@synthesize searchResult;


// Retrieve managed object context and later save the device data
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Get the books from the persitent data storage (or database)
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Book"];
    books = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [searchResult count];
        
    } else
    {
        return [books count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSManagedObject *book = [searchResult objectAtIndex:indexPath.row];
        [cell.textLabel setText:[NSString stringWithFormat:@"%@ - %@", [book valueForKey:@"title"], [book valueForKey:@"author"]]];
        [cell.detailTextLabel setText:[book valueForKey:@"isbn"]];

    } else {
        NSManagedObject *book = [books objectAtIndex:indexPath.row];
        [cell.textLabel setText:[NSString stringWithFormat:@"%@ - %@", [book valueForKey:@"title"], [book valueForKey:@"author"]]];
        [cell.detailTextLabel setText:[book valueForKey:@"isbn"]];

    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the object from database
        [context deleteObject:[books objectAtIndex:indexPath.row]];
        
        // Invoke the Save method to commit the change
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Can not delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove book from table view
        [books removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
  
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"UpdateBook"])
    {
        NSManagedObject *selectedBook = [books objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        
        BookActionViewController *bookActionViewController = segue.destinationViewController;
        bookActionViewController.book = selectedBook;
    }
    
}


#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	NSLog(@"Previous Search Results were removed.");
	[self.searchResult removeAllObjects];
    
	for (NSManagedObject *book in self.books)
	{
		NSString *title = [book valueForKey:@"title"];
        if ([scope isEqualToString:@"All"] || [title isEqualToString:scope])
		{
			NSComparisonResult result = [title compare:searchText
                                                   options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)
                                                     range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.searchResult addObject:book];
            }
		}
	}
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:@"All"];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:@"All"];
    return YES;
}

@end