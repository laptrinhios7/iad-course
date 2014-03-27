//
//  PVDDateTimePickerViewController.m
//  PickerViewDemo
//
//  Created by Vu Tran Lam on 11/17/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "PVDDateTimePickerViewController.h"

@interface PVDDateTimePickerViewController ()

@property (nonatomic, strong) UIDatePicker *dateTimePickerView;
@property (strong, nonatomic) IBOutlet UILabel *currentDateTimeLabel;

@end

@implementation PVDDateTimePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

// Method to get the selected date in UIDatePicker and display on the label
- (void)datePickerDateChanged:(UIDatePicker *)paramDatePicker
{
    if ([paramDatePicker isEqual:self.dateTimePickerView])
    {
        // Set date format
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //[dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss zzz"];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:self.dateTimePickerView.date];
        self.currentDateTimeLabel.text = [NSString stringWithFormat:@"Selected Date: %@", dateString];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dateTimePickerView = [[UIDatePicker alloc]init];
    self.dateTimePickerView.center = self.view.center;
    
    // Change the date picker mode
    self.dateTimePickerView.datePickerMode = UIDatePickerModeDate;
    
    // Set the minimun date and maximum date, so you can not select the date before minimum date
    NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
    NSDate *todayDate = [NSDate date];
    NSDate *oneYearFromToday = [todayDate dateByAddingTimeInterval:oneYearTime];
    NSDate *twoYearsFromToday = [todayDate dateByAddingTimeInterval:2 * oneYearTime];
    self.dateTimePickerView.minimumDate = oneYearFromToday;
    self.dateTimePickerView.maximumDate = twoYearsFromToday;
    
    
    [self.view addSubview:self.dateTimePickerView];
    
    // Use addTarget:action:forControlEvents: method send the message from the picker to it's target whenever the user has selected different date
    [self.dateTimePickerView addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
