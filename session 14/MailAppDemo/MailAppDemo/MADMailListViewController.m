//
//  MADMailListViewController.m
//  MailAppDemo
//
//  Created by Vu Tran Lam on 11/4/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "MADMailListViewController.h"
#import "MADSendMailViewController.h"

@interface MADMailListViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *firstUnreadImage;
@property (strong, nonatomic) IBOutlet UIImageView *secondUnreadImage;
@property (strong, nonatomic) IBOutlet UIImageView *firstAttachImage;
@property (strong, nonatomic) IBOutlet UIImageView *secondAttachImage;
@property (strong, nonatomic) IBOutlet UIImageView *thirdAttachImage;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *composeButton;

- (IBAction)editAction:(id)sender;
- (IBAction)cancelAction:(id)sender;

@end

@implementation MADMailListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Set tint color for the firstUnreadImage
    UIImage *firstUnreadIcon = self.firstUnreadImage.image;
    // Set the rendering mode to respect tint color
    firstUnreadIcon = [firstUnreadIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.firstUnreadImage.image = firstUnreadIcon;
    self.firstUnreadImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // Set tint color for the secondUnreadImage
    UIImage *secondUnreadIcon = self.secondUnreadImage.image;
    // Set the rendering mode to respect tint color
    secondUnreadIcon = [secondUnreadIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.secondUnreadImage.image = secondUnreadIcon;
    self.secondUnreadImage.contentMode = UIViewContentModeScaleAspectFill;
    
    // Enable the toolbar in table view
    self.navigationController.toolbarHidden = NO;
    
    
    // Set tint color for the firstAttachFile
    UIImage *firstAttachFile = self.firstAttachImage.image;
   
    // Set the rendering mode to respect tint color
    self.firstAttachImage.tintColor = [UIColor grayColor];
    firstAttachFile = [firstAttachFile imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    // And set to the image view
    self.firstAttachImage.image = firstAttachFile;
    self.firstAttachImage.contentMode = UIViewContentModeScaleAspectFit;

    
    // Set tint color for the secondAttachFile
    UIImage *secondAttachFile = self.firstAttachImage.image;
    
    // Set the rendering mode to respect tint color
    self.secondAttachImage.tintColor = [UIColor grayColor];
    secondAttachFile = [secondAttachFile imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    // And set to the image view
    self.secondAttachImage.image = firstAttachFile;
    self.secondAttachImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // Set tint color for the thirdAttachFile
    UIImage *thirdAttachFile = self.firstAttachImage.image;
    
    // Set the rendering mode to respect tint color
    self.thirdAttachImage.tintColor = [UIColor grayColor];
    thirdAttachFile = [thirdAttachFile imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    // And set to the image view
    self.thirdAttachImage.image = firstAttachFile;
    self.thirdAttachImage.contentMode = UIViewContentModeScaleAspectFit;

    
    // Create bar item (including spacer)
    UIBarButtonItem *composeBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(composeAction:)];
    composeBarButton.width = 50;
    composeBarButton.style = UIBarButtonItemStyleBordered;

    
    UIBarButtonItem *fixedSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    fixedSpacer.width = 25;
    
    UIBarButtonItem *lefFlexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *rightFlexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    // Create label bar item
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 0.0, self.view.frame.size.width, 42.0f)];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    // Set text of label displaying on two lines
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLabel.numberOfLines = 0;
    titleLabel.text = [NSString stringWithFormat:@"Updated Just Now \n2 Unread"];
    
    // Set grayColor to the second line
    NSMutableAttributedString *labelString = [[NSMutableAttributedString alloc] initWithAttributedString:titleLabel.attributedText];
    [labelString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(16, 10)];
    [titleLabel setAttributedText: labelString];
    
    titleLabel.userInteractionEnabled = NO;
    titleLabel.font =[UIFont fontWithName:@"Helvetica-Light" size:12];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UIBarButtonItem *labelBarItem = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    
    
    
    // Add all above bar items to toolbar and set center align to label bar item (add fixed and flexible bar item)
    
    self.toolbarItems = [NSArray arrayWithObjects:fixedSpacer, lefFlexSpacer, labelBarItem, rightFlexSpacer, composeBarButton, nil];
    
    //NSMutableArray *items = [[self.navigationController.toolbar items] mutableCopy];
   
    //[items addObjectsFromArray:self.toolbarItems];
    
    [self.navigationController.toolbar setItems:self.toolbarItems animated:YES];

    //self.toolbarItems = [NSArray arrayWithObjects:fixedSpacer, lefFlexSpacer, labelBarItem, rightFlexSpacer, composeBarButton, nil];
    //[self.navigationController.toolbar setItems:self.toolbarItems animated:YES];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)composeAction:(id)sender
{
    
    // Open modal view with navigator item
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    MADSendMailViewController *sendMailController = (MADSendMailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SendMailNavController"];
    // Access through navigation controller (root view controoler of modal view)
    [sendMailController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    sendMailController.navigationController.navigationBarHidden = NO;
    [self.navigationController presentViewController:sendMailController animated:YES completion:nil];

}



- (IBAction)editAction:(id)sender
{
    [self.tableView setEditing:YES animated:YES];
    self.navigationItem.rightBarButtonItem = self.cancelButton;
}

- (IBAction)cancelAction:(id)sender
{
    [self.tableView setEditing:NO animated:YES];
    self.navigationItem.rightBarButtonItem = self.editButton;
}
@end
