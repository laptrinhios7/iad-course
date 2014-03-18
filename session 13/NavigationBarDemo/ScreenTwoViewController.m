//
//  ScreenTwoViewController.m
//  Session11-NavBarDemo
//
//  Created by Vu Tran Lam on 10/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ScreenTwoViewController.h"

@interface ScreenTwoViewController ()

@end

@implementation ScreenTwoViewController

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
    // Adding image as right button
    UIImage *rightImage = [UIImage imageNamed:@"NavBarButton"];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:rightImage style:UIBarButtonItemStyleBordered target:self action:@selector(action)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
