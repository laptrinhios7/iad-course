//
//  WBDWebBrowserViewController.h
//  WebBrowserDemo
//
//  Created by Vu Tran Lam on 12/3/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBDWebViewProgress.h"

@interface WBDWebBrowserViewController : UIViewController <UIWebViewDelegate, UITextFieldDelegate, WBDWebViewProgressDelegate>

@property (strong, nonatomic) NSURL *URL;

/** The array of data objects on which to perform the activity. */
@property (strong, nonatomic) NSArray *activityItems;

/** An array of UIActivity objects representing the custom services that your application supports. */
@property (strong, nonatomic) NSArray *applicationActivities;

/** The list of services that should not be displayed. */
@property (strong, nonatomic) NSArray *excludedActivityTypes;

@end
