//
//  TwoViewController.m
//  Session11-MoreTabBarDemo
//
//  Created by Vu Tran Lam on 10/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TwoViewController.h"
#import "LandscapeViewController.h"

@interface TwoViewController ()

@property (nonatomic, strong) NSArray *dataArray;
//@property (nonatomic, strong) IBOutlet LandscapeViewController *landscapeViewController;


@end

@implementation TwoViewController

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
    
    self.dataArray = @[@"Cherry Lake", @"Don Pedro Lake"];
    
}

#pragma -mark - UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *stbName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *Mystoryboard = [UIStoryboard storyboardWithName:stbName bundle:nil];
    LandscapeViewController *landscapeController = [Mystoryboard instantiateViewControllerWithIdentifier:@"LandscapeImageView"];
    landscapeController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:landscapeController animated:NO completion:^
    {
        UIImage *newImage = nil;
        switch (indexPath.row)
        {
            case 0:
                newImage = [UIImage imageNamed:@"CherryLake"];
                break;
            case 1:
                newImage = [UIImage imageNamed:@"DonpedroLake"];
                break;
        }
        landscapeController.imageView.image = newImage;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
