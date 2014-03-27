//
//  WBDWebBrowserViewController.m
//  WebBrowserDemo
//
//  Created by Vu Tran Lam on 12/3/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "WBDWebBrowserViewController.h"
#import "WBDSafariActivity.h"
#import "WBDWebViewProgressView.h"

static const CGFloat kNavBarHeight = 52.0f;
static const CGFloat kLabelHeight = 7.0f;
static const CGFloat kMargin = 10.0f;
static const CGFloat kSpacer = 10.0f; // Space to Webview, dafault = 2
static const CGFloat kLabelFontSize = 12.0f;
static const CGFloat kAddressHeight = 26.0f;

@interface WBDWebBrowserViewController ()<UIWebViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stop;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refresh;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *action;

@property (strong, nonatomic) UILabel *pageTitle;
//@property (strong, nonatomic) UITextField *addressField;

@property (strong, nonatomic) IBOutlet UITextField *addressField;

- (IBAction)refreshAction:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *refreshButton;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

- (IBAction)action:(id)sender;
- (IBAction)cancelAction:(id)sender;

- (void)loadRequestFromAddressField:(id)addressField;
- (void)loadRequestFromString:(NSString*)urlString;

- (void)updateButtons;
- (void)updateTitle:(UIWebView*)aWebView;
- (void)updateAddress:(NSURLRequest*)request;

- (void)informError:(NSError*)error;
@end

@implementation WBDWebBrowserViewController
{
    WBDWebViewProgressView *_progressView;
    WBDWebViewProgress *_progressProxy;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup progress bar
    _progressProxy = [[WBDWebViewProgress alloc] init];
    //_webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.5f;
    CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    _progressView = [[WBDWebViewProgressView alloc] initWithFrame:barFrame];
    
    self.addressField.delegate = self;
    
    self.addressField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.webView.delegate = _progressProxy;
    self.URL = [NSURL URLWithString:@"http://apple.com"];
    [self loadRequestFromString:@"http://apple.com"];
    
    
    // Setup forward and backward buttons
    self.back.image = [self backButtonImage];
    self.forward.image = [self forwardButtonImage];
    
    // Setup activity sheet
    WBDSafariActivity *safariActivity = [[WBDSafariActivity alloc] init];
    self.applicationActivities = @[safariActivity];
    self.excludedActivityTypes = @[UIActivityTypeMail, UIActivityTypeMessage, UIActivityTypePostToWeibo];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Remove progress view
    // because UINavigationBar is shared with other ViewControllers
}

- (void)textFieldDidBeginEditing:(UITextField *)addressField
{
    
    
    //    [UIView beginAnimations:nil context:nil];
    //    //[UIView setAnimationBeginsFromCurrentState:YES];
    //    [UIView setAnimationDuration:0.5];
    //    //[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //
    //    //self.addressField.frame = CGRectMake(self.addressField.frame.origin.x, self.addressField.frame.origin.y, self.navigationController.navigationBar.bounds.size.width - self.cancelButton.width, self.addressField.frame.size.height);
    //    //self.button.hidden = NO;
    //
    //
    //    [UIView commitAnimations];
    self.navigationItem.rightBarButtonItem = self.cancelButton;
    
    /*
     [UIView animateWithDuration:0.5f
     delay:0.0f
     options:UIViewAnimationOptionCurveLinear
     animations:^{
     self.addressField.frame = CGRectMake(self.addressField.frame.origin.x, self.addressField.frame.origin.y, self.navigationController.navigationBar.bounds.size.width - 35, self.addressField.frame.size.height);                     }
     completion:^(BOOL finished){
     self.navigationItem.rightBarButtonItem = self.cancelButton;
     
     }
     ];*/
    
    
}




- (IBAction)cancelAction:(id)sender {
    
    self.navigationItem.rightBarButtonItem = nil;
    //    [UIView beginAnimations:nil context:nil];
    //    //self.addressField.frame = CGRectMake(self.addressField.frame.origin.x, self.addressField.frame.origin.y, self.navigationController.navigationBar.bounds.size.width, self.addressField.frame.size.height);
    //
    //
    //    [UIView commitAnimations];
    [self.addressField resignFirstResponder];
}

#pragma mark - Helpers

- (UIImage *)backButtonImage
{
    static UIImage *image;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        CGSize size = CGSizeMake(12.0, 21.0);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 1.5;
        path.lineCapStyle = kCGLineCapButt;
        path.lineJoinStyle = kCGLineJoinMiter;
        [path moveToPoint:CGPointMake(11.0, 1.0)];
        [path addLineToPoint:CGPointMake(1.0, 11.0)];
        [path addLineToPoint:CGPointMake(11.0, 20.0)];
        [path stroke];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    });
    
    return image;
}

- (UIImage *)forwardButtonImage
{
    static UIImage *image;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        UIImage *backButtonImage = [self backButtonImage];
        
        CGSize size = backButtonImage.size;
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGFloat x_mid = size.width / 2.0;
        CGFloat y_mid = size.height / 2.0;
        
        CGContextTranslateCTM(context, x_mid, y_mid);
        CGContextRotateCTM(context, M_PI);
        
        [backButtonImage drawAtPoint:CGPointMake(-x_mid, -y_mid)];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    });
    
    return image;
}



- (BOOL) textFieldShouldReturn:(UITextField *) textField
{
    NSString *url = self.addressField.text;
    
    [self loadRequestFromString:url];
    [self.addressField resignFirstResponder];
    
    // Set refresh right button
    UIImage *reloadIcon = [UIImage imageNamed:@"Reload"];
    //[reloadIcon resizableImageWithCapInsets: UIEdgeInsetsMake(4, 0, 10, 4)];
    
    // Set the rendering mode to respect tint color
    reloadIcon = [reloadIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.refreshButton setImage:reloadIcon forState:UIControlStateNormal];
    self.addressField.rightView = self.refreshButton;
    //self.addressField.rightView = [[UIImageView alloc] initWithImage: reloadIcon];
    self.addressField.rightViewMode = UITextFieldViewModeUnlessEditing;
    
    
    return YES;
}

#pragma mark - Loading URLs

- (IBAction)action:(id)sender
{
    
    
    NSArray *activityItems;
    if (self.activityItems)
    {
        activityItems = [self.activityItems arrayByAddingObject:self.URL];
    }
    else
    {
        activityItems = @[self.URL];
    }
    
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                     applicationActivities:self.applicationActivities];
    if (self.excludedActivityTypes) {
        vc.excludedActivityTypes = self.excludedActivityTypes;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            [self presentViewController:vc animated:YES completion:NULL];
        }
    }
    
}


- (void)loadRequestFromAddressField:(id)addressField
{
    
    NSString *urlString = [addressField text];
    [self loadRequestFromString:urlString];
}

- (void)loadRequestFromString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    if(!url.scheme)
    {
        NSString* modifiedURLString = [NSString stringWithFormat:@"http://%@", urlString];
        url = [NSURL URLWithString:modifiedURLString];
    }
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

#pragma mark - Updating the UI
- (void)updateButtons
{
    self.forward.enabled = self.webView.canGoForward;
    self.back.enabled = self.webView.canGoBack;
    self.stop.enabled = self.webView.loading;
}

- (void)updateTitle:(UIWebView*)aWebView
{
    NSString* pageTitle = [aWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.pageTitle.text = pageTitle;
}

- (void)updateAddress:(NSURLRequest*)request
{
    NSURL* url = [request mainDocumentURL];
    NSString* absoluteString = [url absoluteString];
    self.addressField.text = absoluteString;
}

#pragma mark - Error Handling

- (void)informError:(NSError *)error
{
    NSString* localizedDescription = [error localizedDescription];
    UIAlertView* alertView = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Error", @"Title for error alert.")
                              message:localizedDescription delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", @"OK button in error alert.")
                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(WBDWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self updateAddress:request];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    [self updateTitle:webView];
    [self updateAddress:[webView request]];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
    [self informError:error];
}

- (IBAction)refreshAction:(id)sender
{
    NSLog(@"Call refresh action");
    [self loadRequestFromAddressField:self.addressField];
}

@end