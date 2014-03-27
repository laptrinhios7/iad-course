//
//  WVDWebViewController.m
//  WebViewDemo
//
//  Created by Vu Tran Lam on 11/22/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "WVDWebViewController.h"


@interface WVDWebViewController () <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation WVDWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"http://apple.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    
}

@end
