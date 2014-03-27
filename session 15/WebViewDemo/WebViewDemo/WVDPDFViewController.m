//
//  WVDPDFViewController.m
//  WebViewDemo
//
//  Created by Vu Tran Lam on 11/22/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "WVDPDFViewController.h"

@interface WVDPDFViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;



@end

@implementation WVDPDFViewController

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
    
    // Open from Web
    /*NSURL *targetURL = [NSURL URLWithString:@"http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebView_Class/UIWebView_Class.pdf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [self.webView loadRequest:request];*/
    
    // Open local file
    NSURL *localURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Sample.pdf" ofType:nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:localURL];
    [self.webView loadRequest:request];

    
}

@end
