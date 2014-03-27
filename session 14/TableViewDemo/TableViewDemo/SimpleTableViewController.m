//
//  SimpleTableViewController.m
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "SimpleTableViewController.h"

@interface SimpleTableViewController ()

@property (nonatomic, strong) NSArray *timeZoneNames;

@end

@implementation SimpleTableViewController

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
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    
    // Retrieve the array of known time zone names and sort the array
    NSArray *timeZones = [NSTimeZone knownTimeZoneNames];
    self.timeZoneNames = [timeZones sortedArrayUsingSelector:@selector(localizedStandardCompare:)];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return  [self.timeZoneNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
	/*
     Retrieve a cell with the given identifier from the table view.
     The cell is defined in the main storyboard: its identifier is MyIdentifier, and  its selection style is set to None.
     */
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
	// Set up the cell.
	NSString *timeZoneName = [self.timeZoneNames objectAtIndex:indexPath.row];
	cell.textLabel.text = timeZoneName;
    
    
    UIImage *shinobiHead = [UIImage imageNamed:@"Clock"];
    // Set the rendering mode to respect tint color
    shinobiHead = [shinobiHead imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    
    cell.imageView.image = shinobiHead;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
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
