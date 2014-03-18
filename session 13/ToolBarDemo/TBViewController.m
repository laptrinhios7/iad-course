//
//  TBViewController.m
//  Session11-ToolbarDemo
//
//  Created by Vu Tran Lam on 10/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TBViewController.h"

@interface TBViewController () <UINavigationBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *pickerViewArray;
@property (nonatomic, assign) UIBarButtonSystemItem currentSystemItem;

@end

@implementation TBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Initialize system button name picker
    self.pickerViewArray= @[
                            @"Done",
                            @"Cancel",
                            @"Edit",
                            @"Save",
                            @"Add",
                            @"FlexibleSpace",
                            @"FixedSpace",
                            @"Compose",
                            @"Reply",
                            @"Action",
                            @"Organize",
                            @"Bookmarks",
                            @"Search",
                            @"Refresh",
                            @"Stop",
                            @"Camera",
                            @"Trash",
                            @"Play",
                            @"Pause",
                            @"Rewind",
                            @"FastForward",
                            @"Undo",
                            @"Redo",
                            @"PageCurl"
                        ];

    //[self updateToolbarItem];
}

- (void)action:(id)sender
{
	//NSLog(@"UIBarButtonItem clicked");
}
- (void)updateToolbarItem
{
    
    UIBarButtonItem *systemItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:self.currentSystemItem target:self action:@selector(action:)];
    [self.toolbar setItems:@[systemItem]];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // change the left most bar item to what's in the picker
    self.currentSystemItem = [pickerView selectedRowInComponent:0];
    [self updateToolbarItem];

}

#pragma mark - UIPickerViewDataSource
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerViewArray objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 240.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerViewArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (IBAction)toogleBarStyle:(id)sender
{
    switch ([sender selectedSegmentIndex])
    {
        case 0:
            self.toolbar.barStyle = UIBarStyleDefault;
            break;
        case 1:
            self.toolbar.barStyle = UIBarStyleBlackOpaque;
            break;
        case 2:
            self.toolbar.barStyle = UIBarStyleBlackTranslucent;
            break;
    }
}


- (IBAction)toggleImage:(id)sender
{
    
    UISwitch *switchImage = (UISwitch *)sender;
    if (switchImage.on)
    {
        [self.toolbar setBackgroundImage:[UIImage imageNamed:@"toolbarBackground.png"] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
        
    }
    else
    {
        [self.toolbar setBackgroundImage:nil forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
    }

}

- (IBAction)toggleTintColor:(id)sender
{

    UISwitch *switchTintColor = (UISwitch *)sender;
    if (switchTintColor.on)
    {
        self.toolbar.tintColor = [UIColor redColor];
    }
    else
    {
        self.toolbar.tintColor = nil; // no color;

    }
}
@end
