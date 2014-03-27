//
//  IDDColorPickerViewController.m
//  PopoverControllerDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDColorPickerViewController.h"


@interface IDDColorPickerViewController ()

@end

@implementation IDDColorPickerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
        _colorNames = [NSMutableArray array];
        [_colorNames addObject:@"Red"];
        [_colorNames addObject:@"Green"];
        [_colorNames addObject:@"Blue"];
        // Make row selection persist
        self.clearsSelectionOnViewWillAppear = NO;
        
        // Calculate how tall the view should be by multplying the individual row by the total number of rows
        NSInteger rowCount = [_colorNames count];
        NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSInteger totalRowHeight = rowCount * singleRowHeight;
        
        // Calculate how wide the view should be finding how wide each string is expected to be
        CGFloat largestLabelWidth = 0;
        for (NSString *colorName in _colorNames)
        {
            // Check size of text using the default font for UITableViewCell's textlabel
            CGSize labelSize = [colorName sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
            if (labelSize.width >largestLabelWidth)
            {
                largestLabelWidth = labelSize.width;
            }
        }
        
        // Add a little padding to the width
        CGFloat popoverWidth = largestLabelWidth + 100;
        
        // Set the porperty to tell the popover container how big this view will be
        self.preferredContentSize = CGSizeMake(popoverWidth, totalRowHeight);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [_colorNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [_colorNames objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedColorName = [_colorNames objectAtIndex:indexPath.row];
    
    // Create a variable to hold the color, making its default color smth annoying and obivous so you can
    // see if you have missed a case here
    UIColor *color = [UIColor orangeColor];
    
    // Set the color object based on the selected color name
    if ([selectedColorName isEqualToString:@"Red"])
    {
        color = [UIColor redColor];
    }
    else if ([selectedColorName isEqualToString:@"Green"])
    {
        color = [UIColor greenColor];
    }
    else if ([selectedColorName isEqualToString:@"Blue"])
    {
        color = [UIColor blueColor];
    }
    
    // Notify the delegate if it exist
    if (_delegate)
    {
        [_delegate selectedColor:color];
    }
        
}

@end
