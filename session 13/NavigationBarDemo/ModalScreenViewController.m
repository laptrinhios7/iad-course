//
//  ModalScreenViewController.m
//  Session11-NavBarDemo
//
//  Created by Vu Tran Lam on 10/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ModalScreenViewController.h"

@interface ModalScreenViewController ()

@end

@implementation ModalScreenViewController

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


- (IBAction)closeModalScene:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
