//
//  TMDAddProductViewController.m
//  TableManipulationDemo-Action
//
//  Created by Vu Tran Lam on 10/26/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDAddProductViewController.h"


@interface TMDAddProductViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameInput;

@property (strong, nonatomic) IBOutlet UITextField *typeInput;
@property (strong, nonatomic) IBOutlet UITextField *yearInput;
@property (strong, nonatomic) IBOutlet UITextField *priceInput;


@end

@implementation TMDAddProductViewController

#pragma mark - Table view delegate

- (IBAction)done:(id)sender
{
    NSString *typeString = self.typeInput.text;
    NSString *nameString = self.nameInput.text;
    NSString *yearString = self.yearInput.text;
    NSString *priceString = self.priceInput.text;
    
    NSNumberFormatter *decimalFormat = [[NSNumberFormatter alloc] init];
    [decimalFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *priceNumber = [decimalFormat numberFromString:priceString];
    
    NSNumberFormatter *integerFormat = [[NSNumberFormatter alloc] init];
    [integerFormat setNumberStyle:NSNumberFormatterNoStyle];
    NSNumber *yearNumber = [integerFormat numberFromString:yearString];
    
    [[self delegate] addProductViewControllerDidFinish:self name:nameString type:typeString year:yearNumber price:priceNumber];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == self.typeInput) || (textField == self.nameInput))
    {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
