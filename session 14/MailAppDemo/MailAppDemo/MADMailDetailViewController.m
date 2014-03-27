//
//  MADMailDetailViewController.m
//  MailAppDemo
//
//  Created by Vu Tran Lam on 11/5/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "MADMailDetailViewController.h"

@interface MADMailDetailViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *upBarButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *downBarButton;
@property (strong, nonatomic) IBOutlet UIImageView *contactImage;

@end

@implementation MADMailDetailViewController

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
    
    // Change the default title of back bar button
    self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Inbox (1)" style:UIBarButtonItemStylePlain target:nil action:nil];

    // Create two custom bar item with image
    
    // Create up bar button
    UIButton *upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(0, 0, 22, 22);
    
    // Set tint color for upImageButton
    UIImage *upImageButton = [UIImage imageNamed:@"Up"];
    upImageButton = [upImageButton imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [upButton setImage:upImageButton forState:UIControlStateNormal];
    [upButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *upBarButton = [[UIBarButtonItem alloc] initWithCustomView:upButton];
    
    // Create down bar button
    UIButton *downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(0, 0, 22, 22);
    
    // Set tint color for the downImageButton
    UIImage *downImageButton = [UIImage imageNamed:@"Down"];
    downImageButton = [downImageButton imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [downButton setImage:downImageButton forState:UIControlStateNormal];
    [downButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *downBarButton = [[UIBarButtonItem alloc] initWithCustomView:downButton];
    
    NSArray *rightBarItemArray = [NSArray arrayWithObjects:upBarButton, downBarButton, nil];
    
    self.navigationItem.rightBarButtonItems = rightBarItemArray;
    
    // Set tint color for contactImage
    UIImage *tintColorImage = self.contactImage.image;
    tintColorImage = [tintColorImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.contactImage.image = tintColorImage;

}

@end
