//
//  TMDAddProductViewController.m
//  TableManipulationDemo-Action
//
//  Created by Vu Tran Lam on 10/26/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDAddProductViewController.h"
#import "TMDCategoriesViewController.h"


@interface TMDAddProductViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameInput;
@property (strong, nonatomic) IBOutlet UILabel *categorySelect;

@property (strong, nonatomic) IBOutlet UITextField *yearInput;
@property (strong, nonatomic) IBOutlet UITextField *priceInput;


@end

@implementation TMDAddProductViewController

#pragma mark - Table view delegate

- (IBAction)doneAction:(id)sender
{
    if ([self checkValidate] == YES)
    {
        NSString *nameString = self.nameInput.text;
        NSString *categoryString = self.categorySelect.text;
        NSString *yearString = self.yearInput.text;
        NSString *priceString = self.priceInput.text;
    
        NSNumberFormatter *decimalFormat = [[NSNumberFormatter alloc] init];
        [decimalFormat setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *priceNumber = [decimalFormat numberFromString:priceString];
    
        NSNumberFormatter *integerFormat = [[NSNumberFormatter alloc] init];
        [integerFormat setNumberStyle:NSNumberFormatterNoStyle];
        NSNumber *yearNumber = [integerFormat numberFromString:yearString];
    
        [[self delegate] addProductViewControllerDidFinish:self name:nameString category:categoryString year:yearNumber price:priceNumber];
    }
    else
    {
        UIAlertView *errorAlert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid Input" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    
}

- (IBAction)cancelAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameInput || textField == self.yearInput || self.priceInput)
    {
        [textField resignFirstResponder];
    }
    return YES;
}

// Control the segue programmatically
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SelectCategory"]) {
       
        [(TMDCategoriesViewController *)[segue destinationViewController] setDelegate:self];
       
    }
   
}

// Check validation of data input
- (BOOL)checkValidate
{
    if (self.nameInput.text.length == 0 || self.yearInput.text.length == 0 || self.priceInput.text.length == 0)
    {
        return NO;
    }
    if ([self.categorySelect.text isEqualToString:@"Select Category"])
    {
        return NO;
    }
    return YES;
         
    
}

#pragma mark - SelectionVCDelegate

- (void)selectCategory:(TMDCategoriesViewController *)controller category:(NSString *)category
{
    
    //UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    self.categorySelect.text = category;
    

    [self.navigationController popViewControllerAnimated:YES];
}



@end
