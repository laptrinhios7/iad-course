//
//  BookActionViewController.h
//  CoreDataDemo-Part2
//
//  Created by Vu Tran Lam on 6/7/14.
//  Copyright (c) 2014 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookActionViewController : UIViewController

- (IBAction)savePress:(id)sender;
- (IBAction)cancelPress:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *isbnInput;
@property (strong, nonatomic) IBOutlet UITextField *titleInput;
@property (strong, nonatomic) IBOutlet UITextField *authorInput;

@property (strong, nonatomic) NSManagedObject *book;

@end
