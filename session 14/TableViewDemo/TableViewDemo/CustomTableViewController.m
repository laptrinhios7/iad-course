//
//  CustomTableViewController.m
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CustomTableViewController.h"
#import "TVDRegion.h"
#import "TVDTimeZoneWrapper.h"
#import "TVDTimeZoneCell.h"

@interface CustomTableViewController ()

@property (nonatomic, weak) NSTimer *minuteTimer;


@end

/*
 Table view row height and cell height are defined as 60 in the storyboard.
 */

@implementation CustomTableViewController

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
    
    // Set the font and color style of table section header
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[UIFont fontWithName:@"Helvetica Light" size:18]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[UIColor redColor]];
    


    NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	self.calendar = calendar;
	self.displayList = [self regionsWithCalendar:calendar];

}

- (NSArray *)regionsWithCalendar:(NSCalendar *)calendar {
	/*
	 Create an array of Region objects.
	 Each object represents a geographical region.  Each region contains time zones.
	 Much of the information required to display a time zone is expensive to compute, so rather than using NSTimeZone objects directly use wrapper objects that calculate the required derived values on demand and cache the results.
	 */
	NSArray *knownTimeZoneNames = [NSTimeZone knownTimeZoneNames];
    
	NSMutableArray *regions = [[NSMutableArray alloc] init];
    
	for (NSString *timeZoneName in knownTimeZoneNames) {
        
		NSArray *components = [timeZoneName componentsSeparatedByString:@"/"];
		NSString *regionName = [components objectAtIndex:0];
        
		TVDRegion *region = [TVDRegion regionNamed:regionName];
		if (region == nil) {
			region = [TVDRegion newRegionWithName:regionName];
			region.calendar = calendar;
			[regions addObject:region];
		}
        
		NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:timeZoneName];
		[region addTimeZone:timeZone nameComponents:components];
	}
    
	// Now sort the time zones by name.
	NSDate *date = [[NSDate alloc] init];
	for (TVDRegion *region in regions) {
		[region sortZones];
		[region setDate:date];
	}
    
    // Sort the regions by name.
	NSArray *sortedRegions = [regions sortedArrayUsingComparator:^(id region1, id region2) {
        NSString *name1 = [(TVDRegion *)region1 name];
        NSString *name2 = [(TVDRegion *)region2 name];
        // Do comparison
        return [name1 localizedStandardCompare:name2];
    }];
    
	return sortedRegions;
}

#pragma mark - Table view delegate and data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
	// Number of sections is the number of regions
	return [self.displayList count];
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	// Number of rows is the number of time zones in the region for the specified section
	TVDRegion *region = [self.displayList objectAtIndex:section];
	NSArray *regionTimeZones = region.timeZoneWrappers;
	return [regionTimeZones count];
}


- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
	// Section title is the region name
	TVDRegion *region = [self.displayList objectAtIndex:section];
	return region.name;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
	static NSString *CellIdentifier = @"TimeZoneCell";
    
	TVDTimeZoneCell *cell = (TVDTimeZoneCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	// configureCell:cell forIndexPath: sets the text and image for the cell -- the method is factored out because it's also called during minuted-based updates.
	[self configureCell:cell forIndexPath:indexPath];
	return cell;
}


#pragma mark - Configuring table view cells

- (void)configureCell:(TVDTimeZoneCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    /*
	 Cache the formatter. Normally you would use one of the date formatter styles (such as NSDateFormatterShortStyle), but here we want a specific format that excludes seconds.
	 */
	static NSDateFormatter *dateFormatter = nil;
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
        NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"h:mm a" options:0 locale:[NSLocale currentLocale]];
		[dateFormatter setDateFormat:dateFormat];
	}
    
	// Get the time zones for the region for the section
	TVDRegion *region = [self.displayList objectAtIndex:indexPath.section];
	NSArray *regionTimeZones = region.timeZoneWrappers;
	TVDTimeZoneWrapper *wrapper = [regionTimeZones objectAtIndex:indexPath.row];
    
	// Set the locale name.
	cell.nameLabel.text = wrapper.timeZoneLocaleName;
    
	// Set the time.
	[dateFormatter setTimeZone:wrapper.timeZone];
	cell.timeLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    
	// Set the image.
	cell.timeImageView.image = wrapper.image;
}


#pragma mark - Temporal updates

- (void)viewWillAppear:(BOOL)animated {
    
	/*
	 Set up a timer to update the table view every minute on the minute so that it shows the current time.
	 */
    NSDate *date = [NSDate date];
    NSDate *oneMinuteFromNow = [date dateByAddingTimeInterval:60];
    
	NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
	NSDateComponents *timerDateComponents = [self.calendar components:unitFlags fromDate:oneMinuteFromNow];
	// Add one second to ensure time has passed minute update when the timer fires.
	[timerDateComponents setSecond:1];
	NSDate *minuteTimerDate = [self.calendar dateFromComponents:timerDateComponents];
    
	NSTimer *timer = [[NSTimer alloc] initWithFireDate:minuteTimerDate interval:60 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	self.minuteTimer = timer;
}


- (void)viewWillDisappear:(BOOL)animated {
	self.minuteTimer = nil;
}


- (void)setMinuteTimer:(NSTimer *)newTimer {
    
	if (_minuteTimer != newTimer) {
		[_minuteTimer invalidate];
		_minuteTimer = newTimer;
	}
}


- (void)updateTime:(NSTimer *)timer {
	/*
     To display the current time, redisplay the time labels.
     Don't reload the table view's data as this is unnecessarily expensive -- it recalculates the number of cells and the height of each item to determine the total height of the view etc.  The external dimensions of the cells haven't changed, just their contents.
     */
    NSArray *visibleCells = self.tableView.visibleCells;
    for (TVDTimeZoneCell *cell in visibleCells) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [self configureCell:cell forIndexPath:indexPath];
        [cell setNeedsDisplay];
    }
}


- (void)update:sender {
	/*
	 The following sets the date for the regions, hence also for the time zone wrappers. This has the side-effect of "faulting" the time zone wrappers (see TimeZoneWrapper's setDate: method), so can be used to relieve memory pressure.
	 */
	NSDate *date = [NSDate date];
	for (TVDRegion *region in self.displayList) {
		[region setDate:date];
	}
}


#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    
	[super didReceiveMemoryWarning];
	[self update:self];
}


- (void)dealloc {
	[_minuteTimer invalidate];
}

@end
