//
//  UADMainViewController.m
//  UniversalAppDemo
//
//  Created by Vu Tran Lam on 12/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "UADMainViewController.h"

@interface UADMainViewController ()

@end

@implementation UADMainViewController


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

- (IBAction)playAction:(id)sender
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"New Game" message:@"Start Playing..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        // For iPad
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Game Over" message:@"Just Ended!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
