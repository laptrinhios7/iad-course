//
//  ThreeViewController.m
//  Session11-MoreTabBarDemo
//
//  Created by Vu Tran Lam on 10/15/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "ThreeViewController.h"

NSString *kBadgeValuePrefKey = @"kBadgeValue";  // badge value key for storing to NSUserDefaults

@interface ThreeViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *badgeField;

@end

@implementation ThreeViewController

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
      
    // Register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];

}

// Add right navigation bar button when the keyboard appears
- (void)keyboardWasShown:(NSNotification*)notification
{
    UIBarButtonItem* saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem = saveItem;
    NSLog(@"Begin");
}

// Remove right navigation bar button when the keyboard disappears
- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    self.navigationItem.rightBarButtonItem = nil;
    NSLog(@"End");
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	BOOL result = YES;
	
	// restrict the maximum number of characters to 5
	if (textField.text.length == 5 && string.length > 0)
		result = NO;
	
	return result;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneAction:(id)sender
{
    // Dismiss the keyboard by resigning our badge edit field as first responder
    [self.badgeField resignFirstResponder];
    
    // Set the badget value to our tab item (but only if a valid string)
    if (self.badgeField.text.length > 0)
    {
        NSString *value = self.badgeField.text;
        self.tabBarItem.badgeValue = value;
    }
    else
    {
        self.tabBarItem.badgeValue = nil;
    }
    [[NSUserDefaults standardUserDefaults] setValue:self.badgeField.text forKey:kBadgeValuePrefKey];
}

@end
