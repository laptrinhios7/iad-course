//
//  SectionedTableViewController.m
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "SectionedTableViewController.h"
#import "TVDRegion.h"
#import "TVDTimeZoneWrapper.h"

NSString *localeNameForTimeZoneNameComponents(NSArray *nameComponents);
NSMutableDictionary *regionDictionaryWithNameInArray(NSString *name, NSArray *array);

@interface SectionedTableViewController ()

@end

@implementation SectionedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setRegions:[TVDRegion knownRegions]];
    
    // Set the font and color style of table section header
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[UIFont fontWithName:@"Helvetica Light" size:18]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[UIColor redColor]];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Number of sections is the number of regions.
	return [self.regions count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Number of rows is the number of time zones in the region for the specified section.
	TVDRegion *region = [self.regions objectAtIndex:section];
	return [region.timeZoneWrappers count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// The header for the section is the region name -- get this from the region at the section index.
	TVDRegion *region = self.regions[section];
	return region.name;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *MyIdentifier = @"MyIdentifier1";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
	// Get the section index, and so the region for that section.
	TVDRegion *region = self.regions[indexPath.section];
	TVDTimeZoneWrapper *timeZoneWrapper = [region.timeZoneWrappers objectAtIndex:indexPath.row];
    
	// Set the cell's text to the name of the time zone at the row
	cell.textLabel.text = timeZoneWrapper.timeZoneLocaleName;
	return cell;
}



/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
