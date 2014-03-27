//
//  SVDPagedScrollViewController.m
//  ScrollViewDemo
//
//  Created by Vu Tran Lam on 11/13/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "SVDPagedScrollViewController.h"

@interface SVDPagedScrollViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation SVDPagedScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIImageView *)createImageView:(UIImage *)paramImage frame:(CGRect)paramFrame
{
    UIImageView *result = [[UIImageView alloc]initWithFrame:paramFrame];
    result.contentMode = UIViewContentModeScaleAspectFit;
    result.image = paramImage;
    return result;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage *iPhone5SImage = [UIImage imageNamed:@"iPhone5S"];
    UIImage *iPadAirImage = [UIImage imageNamed:@"iPadAir"];
    UIImage *macbookAirImage = [UIImage imageNamed:@"MacbookAir"];
    
    CGRect scrollViewRect = self.view.bounds;
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:scrollViewRect];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(scrollViewRect.size.width * 3.0f, scrollViewRect.size.height);
    
    [self.view addSubview:self.scrollView];
    
    CGRect imageViewRect = self.view.bounds;
    UIImageView *iPhone5SImageView = [self createImageView:iPhone5SImage frame:imageViewRect];
    [self.scrollView addSubview:iPhone5SImageView];
    
    // Go to next page in scroll view
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *iPadAirImageView = [self createImageView:iPadAirImage frame:imageViewRect];
    [self.scrollView addSubview:iPadAirImageView];
    
    // Go to last page in scroll view
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *macbookAirImageView = [self createImageView:macbookAirImage frame:imageViewRect];
    [self.scrollView addSubview:macbookAirImageView];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
