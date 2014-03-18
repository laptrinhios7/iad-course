//
//  ScreenThreeViewController.m
//  Session11-NavBarDemo
//
//  Created by Vu Tran Lam on 10/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ScreenThreeViewController.h"

@interface ScreenThreeViewController ()

@end

@implementation ScreenThreeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Add segmented controls in right bar button
    NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"UpButton"], [UIImage imageNamed:@"DownButton"], nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:imageArray];
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(0, 0, 90, 30);


	segmentedControl.momentary = YES;
	
	UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc]initWithCustomView:segmentedControl];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentAction:(id)sender
{
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    NSLog(@"Segment clicked: %d", segmentControl.selectedSegmentIndex);
}

@end
