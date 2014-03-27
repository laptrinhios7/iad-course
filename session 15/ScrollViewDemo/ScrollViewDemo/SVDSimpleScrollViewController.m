//
//  SVDSimpleScrollViewController.m
//  ScrollViewDemo
//
//  Created by Vu Tran Lam on 11/13/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "SVDSimpleScrollViewController.h"

@interface SVDSimpleScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView  *scrollView;

@end

@implementation SVDSimpleScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    //self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
    
    UIImage *macbookAirImage = [UIImage imageNamed:@"iPhone5S"];
    
    //self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    //self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //self.imageView.image = macbookAirImage;
    //self.imageView.center = self.view.center;
   
    self.imageView = [[UIImageView alloc] initWithImage:macbookAirImage];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    // Set scroll view delegate to current view controller delegate
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.imageView.bounds.size;
    [self.view addSubview:self.scrollView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark UIScrollViewDelegate

// Call when scrolling
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.scrollView.alpha = 0.50f;
}

// Call when scrolling activity ended
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.scrollView.alpha = 1.0f;
    
}

@end
