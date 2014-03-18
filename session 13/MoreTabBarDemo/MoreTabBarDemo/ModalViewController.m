//
//  ModalViewController.m
//  Session11-MoreTabBarDemo
//
//  Created by Vu Tran Lam on 10/16/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

- (IBAction)dismissAction:(id)sender;

@end

@implementation ModalViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
