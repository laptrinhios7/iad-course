//
//  BookActionViewController.m
//  CoreDataDemo-Part1
//
//  Created by Vu Tran Lam on 6/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import "BookActionViewController.h"

@interface BookActionViewController ()

@end

@implementation BookActionViewController

@synthesize isbnInput;
@synthesize titleInput;
@synthesize authorInput;

@synthesize book;

// Retrieve managed object context and later save the device data
- (NSManagedObjectContext *)manageObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)savePress:(id)sender
{
    NSManagedObjectContext *context = [self manageObjectContext];
    // Create a new car
    NSManagedObject *newCar = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    NSString *isbn = isbnInput.text;
    NSString *title = titleInput.text;
    NSString *author = authorInput.text;
    [newCar setValue:isbn forKeyPath:@"isbn"];
    [newCar setValue:title forKeyPath:@"title"];
    [newCar setValue:author forKeyPath:@"author"];
    
    NSError *error = nil;
    
    // Save the context
    
    if (![context save:&error])
    {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelPress:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
