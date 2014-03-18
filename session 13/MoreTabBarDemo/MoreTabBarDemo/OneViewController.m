//
//  OneViewController.m
//  Session11-MoreTabBarDemo
//
//  Created by Vu Tran Lam on 10/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "OneViewController.h"
#import "SubLevelViewController.h"

@interface OneViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) IBOutlet SubLevelViewController *subLevel;

@end

@implementation OneViewController

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
    
    // Initialize data array
    self.dataArray = @[@"Mac Pro", @"Mac mini", @"iMac", @"MacBook", @"MacBook Pro", @"MacBook Air"];
    self.subLevel = [[SubLevelViewController alloc]initWithStyle:UITableViewStylePlain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // this UIViewController is about to re-appear, make sure we remove the current selection in our table
    NSIndexPath * tableSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    _subLevel.title = cell.textLabel.text;
	[self.navigationController pushViewController:self.subLevel animated:YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

@end
