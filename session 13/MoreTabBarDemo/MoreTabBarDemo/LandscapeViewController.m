//
//  LandscapeViewController.m
//  Session11-MoreTabBarDemo
//
//  Created by Vu Tran Lam on 10/15/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "LandscapeViewController.h"

@interface LandscapeViewController ()

@property (strong, nonatomic) IBOutlet UIButton *backImageButton;

- (IBAction)doneAction:(id)sender;

@end

@implementation LandscapeViewController

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
    
}

- (IBAction)doneAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Hide the status bar for current screen
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Rotation support for iOS 6.0 and later (override what's defined in our Info.plist)
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape; // support only landscape
}

@end
