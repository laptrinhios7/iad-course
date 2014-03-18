//
//  ScreenFourViewController.m
//  Session11-NavBarDemo
//
//  Created by Vu Tran Lam on 10/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ScreenFourViewController.h"

@interface ScreenFourViewController ()

@end

@implementation ScreenFourViewController

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
    
    // Adding segmented control as the custom title view
	
    NSArray *segmentTextContent = [NSArray arrayWithObjects:NSLocalizedString(@"Image", @""), NSLocalizedString(@"Text",@""), NSLocalizedString(@"Video", @""), nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    segmentedControl.frame = CGRectMake(0, 0, 400, 30);
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;

    
}

- (void)viewWillAppear:(BOOL)animated
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)self.navigationItem.rightBarButtonItem.customView;
    
    // Before we show this view make sure the segmentedControl matches the nav bar style
    if (self.navigationController.navigationBar.barStyle == UIBarStyleBlackTranslucent || self.navigationController.navigationBar.barStyle == UIBarStyleBlackOpaque)
    {
        segmentedControl.tintColor = [UIColor darkGrayColor];
    }
    else
    {
        segmentedControl.tintColor = [UIColor blueColor];
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentAction:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"Segment clicked: %d", segmentedControl.selectedSegmentIndex);
    
}

@end
