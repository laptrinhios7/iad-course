//
//  MADSendMailViewController.m
//  MailAppDemo
//
//  Created by Vu Tran Lam on 11/7/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "MADSendMailViewController.h"


@interface MADSendMailViewController ()

@property (strong, nonatomic) IBOutlet UITextView *mailContent;

- (IBAction)cancelAction:(id)sender;

@end

@implementation MADSendMailViewController

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
    self.navigationController.navigationBarHidden = NO;
   
    [self.contentTextView addSubview:self.contentImageView];
    
}




- (IBAction)cancelAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
