//
//  PVDDateCellViewController.m
//  PickerViewDemo
//
//  Created by Vu Tran Lam on 11/18/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "PVDDateCellViewController.h"


#define kPickerAnimationDuration    0.40    // duration for the animation to slide the data picker into view
#define kDatePickerTag              99      // view tag identifying the date picker view

#define kTitleKey   @"title"    // key for obtaining the data source item's title
#define kDateKey    @"date"     // key for obtaining the data source item;s date

#define kDateStartRow   1   // keep trach of which rows have date cells
#define kDateEndRow     2  

static NSString *kDateCellID = @"dateCell";     // the cells with the start or end date
static NSString *kDatePickerID = @"datePicker";   // the cell containing the date picker
static NSString *kOtherCell = @"otherCell";     // the remaining cells at the end


@interface PVDDateCellViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

// Keep trach which indexPath points to the cell with UIDatePicker
@property (nonatomic, strong) NSIndexPath *datePickerIndexPath;

@property (assign) NSInteger pickerCellRowHeight;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;


- (IBAction)dateAction:(id)sender;


@end

@implementation PVDDateCellViewController

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

    // Setup our data source
    NSMutableDictionary *itemOne = [@{kTitleKey : @"Tap a cell to change date:"} mutableCopy];
    NSMutableDictionary *itemTwo = [@{kTitleKey : @"Start Date", kDateKey : [NSDate date]} mutableCopy];
    NSMutableDictionary *itemThree = [@{kTitleKey : @"End Date", kDateKey : [NSDate date]} mutableCopy];
    NSMutableDictionary *itemFour = [@{kTitleKey : @"Other Item 1"} mutableCopy];
    NSMutableDictionary *itemFive = [@{kTitleKey : @"Other Item 2"} mutableCopy];
    
    self.dataArray = @[itemOne, itemTwo, itemThree, itemFour, itemFive];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    // Obtain the picker view cell's height, works because the cell was pre-defined in our storyboard
    UITableViewCell *pickerViewCellToCheck = [self.tableView dequeueReusableCellWithIdentifier:kDatePickerID];
    self.pickerCellRowHeight = pickerViewCellToCheck.frame.size.height;
    
    // If the local changes while in the background, we need to be notifed so we can update the date format in the table cells
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeChanged:) name:NSCurrentLocaleDidChangeNotification object:nil];
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSCurrentLocaleDidChangeNotification object:nil];
    
}

#pragma mark - Locale

// Repond to region format or locale changes
- (void)localeChanged:(NSNotification *)notificaiton
{
    // If users changed the locale (region format) in Settings, so we are notifed here to update the date format in table view cells
    [self.tableView reloadData];
}

#pragma mark - Utilities

#define EMBEDDED_DATE_PICKER (DeviceSystemMajorVersion() >= 7)

// Determine if the give indexPath has a cell below it with a UIDatePicker
// @param indexPath: to check if its cell has a UIDatePicker below it
- (BOOL)hasPickerForIndexPath:(NSIndexPath *)indexPath
{
    BOOL hasDatePicker = NO;
    
    NSInteger targetedRow = indexPath.row;
    targetedRow++;
    
    UITableViewCell *checkDatePickerCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:targetedRow inSection:0]];
    UIDatePicker *checkDattePicker = (UIDatePicker *)[checkDatePickerCell viewWithTag:kDatePickerTag];
    
    hasDatePicker = (checkDattePicker != nil);
    return hasDatePicker;
}

// Update UIDatePicker's value to match with the date of the cell above it
- (void)updateDatePicker
{
    if (self.datePickerIndexPath != nil)
    {
        UITableViewCell *associatedDatePickerCell = [self.tableView cellForRowAtIndexPath:self.datePickerIndexPath];
        
        UIDatePicker *targetedDatePicker = (UIDatePicker *)[associatedDatePickerCell viewWithTag:kDatePickerTag];
        if (targetedDatePicker != nil)
        {
            // We found a UIDatePicker in this cell, so update it's date value
            NSDictionary *itemData = self.dataArray[self.datePickerIndexPath.row - 1];
            [targetedDatePicker setDate:[itemData valueForKey:kDateKey]  animated:NO];
        }
    }
}

// Determine if the UITableViewController has a UIDatePicker in any of its cells
- (BOOL)hasInlineDatePicker
{
    return (self.datePickerIndexPath != nil);
}

// Determine if the give indexPath points to a cell that contains the UIDatePicker
// @param indexPath: to check if it represents a cell with the UIDatePicker
- (BOOL)indexPathHasPicker:(NSIndexPath *)indexPath
{
    return ([self hasInlineDatePicker] && self.datePickerIndexPath.row == indexPath.row);
}

// Determine if the given indexPath points to a cell that contains the start/end dates
// @param indexPath: to check if it represents start/end date cell
- (BOOL)indexPathHasDate:(NSIndexPath *)indexPath
{
    BOOL hasDate = NO;
    if ((indexPath.row == kDateStartRow) || (indexPath.row == kDateEndRow || ([self hasInlineDatePicker] && (indexPath.row == kDateEndRow + 1))))
    {
        hasDate = YES;
    }
    return hasDate;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ([self indexPathHasPicker:indexPath] ? self.pickerCellRowHeight : self.tableView.rowHeight);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self hasInlineDatePicker])
    {
        // We have a date picker, so allow for it in the number of rows in this section
        NSInteger numRows = self.dataArray.count;
        return ++numRows;
    }
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    NSString *cellID = kOtherCell;
    
    if ([self indexPathHasPicker:indexPath])
    {
        // The indexPath is the one containing the inline date picker
        cellID = kDatePickerID;     // the current/opened date picker cell
    }
    else if ([self indexPathHasDate:indexPath])
    {
        // The indexPath is one that contains the date information
        cellID = kDateCellID;       // the start/end date cells
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (indexPath.row == 0)
    {
        // We decide here that first cell in the table is not selectable (it's just an indicator)
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // If we have a date picker open whose cell is above the cell we want to update, then we have one more cell than the model allows
    NSInteger modelRow = indexPath.row;
    if (self.datePickerIndexPath != nil && self.datePickerIndexPath.row < indexPath.row)
    {
        modelRow--;
    }
    
    NSDictionary *itemData = self.dataArray[modelRow];
    
    // Proceed to configure our cell
    if ([cellID isEqualToString:kDateCellID])
    {
        // We have either start or end date cells, populate their date field
        cell.textLabel.text = [itemData valueForKey:kTitleKey];
        cell.detailTextLabel.text = [self.dateFormatter stringFromDate:[itemData valueForKey:kDateKey]];
    }
    else if ([cellID isEqualToString:kOtherCell])
    {
        // This cell is a non-date cell, just assign it's text label
        cell.textLabel.text = [itemData valueForKey:kTitleKey];
    }
    
	return cell;
}

// Add or remove a UIDatePicker cell below the give indexPath
// @param indexPath: to reveal the UIDatePicker

- (void)toggleDatePickerForSelectedIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView beginUpdates];
    
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]];
    
    // Check if 'indexPath' has an attached date picker below it
    if ([self hasPickerForIndexPath:indexPath])
    {
        // Found a picker below it, so remove it
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        // Did not find a picker below it, so we should insert it
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView endUpdates];
}

// Reveal the date picker inline for the given indexPath, called by 'didSelectionRowAtIndexPath'
// @param indePath: to reveal the UIDatePicker

- (void)displayInlineDatePickerForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Display the date picker inline with the table content
    [self.tableView beginUpdates];
    
    BOOL before = NO;   // Indicate if the date picker is below "indexPath", help us determine which row to reveal
    if ([self hasInlineDatePicker])
    {
        before = self.datePickerIndexPath.row < indexPath.row;
    }
    
    BOOL sameCellClicked = (self.datePickerIndexPath.row - 1 == indexPath.row);
    
    // Remove any date picker cell if it exists
    if ([self hasInlineDatePicker])
    {
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.datePickerIndexPath.row inSection:0]]
                              withRowAnimation:UITableViewRowAnimationFade];
        self.datePickerIndexPath = nil;
    }
    
    if (!sameCellClicked)
    {
        // Hide the old date picker and display the new one
        NSInteger rowToReveal = (before ? indexPath.row - 1 : indexPath.row);
        NSIndexPath *indexPathToReveal = [NSIndexPath indexPathForRow:rowToReveal inSection:0];
        
        [self toggleDatePickerForSelectedIndexPath:indexPathToReveal];
        self.datePickerIndexPath = [NSIndexPath indexPathForRow:indexPathToReveal.row + 1 inSection:0];
    }
    
    // Always deselect the row containing the start or end date
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.tableView endUpdates];
    
    // Inform our date picker of the current date to match the current cell
    [self updateDatePicker];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.reuseIdentifier == kDateCellID)
    {
        [self displayInlineDatePickerForRowAtIndexPath:indexPath];
    }
}

#pragma mark - Actions

// User choose to change the date by changing the vaues inside the UIDatePicker

- (IBAction)dateAction:(id)sender
{
    NSIndexPath *targetedCellIndexPath = nil;
    
    if ([self hasInlineDatePicker])
    {
        // Inline date picker: update the cell's date "above" the date picker cell
        targetedCellIndexPath = [NSIndexPath indexPathForRow:self.datePickerIndexPath.row - 1 inSection:0];
    }
    else
    {
        // External date picker: update the current "selected" cell's date
        targetedCellIndexPath = [self.tableView indexPathForSelectedRow];
    }
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:targetedCellIndexPath];
    UIDatePicker *targetedDatePicker = sender;
    
    // Update our data model
    NSMutableDictionary *itemData = self.dataArray[targetedCellIndexPath.row];
    [itemData setValue:targetedDatePicker.date forKey:kDateKey];
    
    // Update the cell's date string
    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:targetedDatePicker.date];
}




@end
