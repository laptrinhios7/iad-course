//
//  SubLevelViewController.m
//  Session11-MoreTabBarDemo
//
//  Created by Vu Tran Lam on 10/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "SubLevelViewController.h"
#import "ModalViewController.h"

@interface SubLevelViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SubLevelViewController

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

    self.hidesBottomBarWhenPushed = YES;
    self.dataArray = @[@"Feature 1", @"Feature 2"];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *stbName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *Mystoryboard = [UIStoryboard storyboardWithName:stbName bundle:nil];
    ModalViewController *modalController = [Mystoryboard instantiateViewControllerWithIdentifier:@"ModalDetailView"];
    modalController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:modalController animated:NO completion:^
    {
        switch (indexPath.row)
        {
            case 0:
                modalController.titleLabel.text = @"Feature 1";
                break;
            case 1:
                modalController.titleLabel.text = @"Feature 2";
                break;
        }

        [tableView deselectRowAtIndexPath:indexPath animated:YES];
         
    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID2 = @"cellID2";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID2];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID2];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
    
	cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
	
	return cell;
}

@end
