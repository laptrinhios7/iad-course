//
//  PVDCountryListViewController.m
//  PickerViewDemo
//
//  Created by Vu Tran Lam on 11/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "PVDCountryListViewController.h"

@interface PVDCountryListViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *countryPickerView;
@property (nonatomic, strong) NSArray *countryList;
@property (strong, nonatomic) IBOutlet UILabel *currentCountryLabel;

@end

@implementation PVDCountryListViewController

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

    self.countryPickerView = [[UIPickerView alloc]init];
    self.countryPickerView.center = self.view.center;
    self.countryPickerView.showsSelectionIndicator = YES;
    [self.view addSubview:self.countryPickerView];

    
    self.countryPickerView.dataSource = self;
    self.countryPickerView.delegate = self;
    
    self.countryList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"]];
    
    
    
}

#pragma -mark UIPickerViewDataSource

// Return the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([pickerView isEqual:self.countryPickerView])
    {
        return 1;
    }
    return 0;
}

// Return the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.countryPickerView])
    {
        return [self.countryList count];
    }
    return 0;
}

#pragma -mark UIPickerViewDelegate

// Display the content of picker row
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.countryPickerView])
    {
        return [[self.countryList objectAtIndex:row] objectForKey:@"name"];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.currentCountryLabel.text = [NSString stringWithFormat:@"Selected Country: %@", [[self.countryList objectAtIndex:row] objectForKey:@"code"]];
    
}





@end
