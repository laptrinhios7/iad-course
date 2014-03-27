//
//  MADMailboxesViewController.m
//  MailAppDemo
//
//  Created by Vu Tran Lam on 11/1/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <MessageUI/MessageUI.h>

#import "MADMailboxesViewController.h"
#import "MADSendMailViewController.h"
#import "MADMailComposerViewController.h"

@interface MADMailboxesViewController () <MFMailComposeViewControllerDelegate,  UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *inboxImage;
@property (strong, nonatomic) IBOutlet UIImageView *starImage;

@property (strong, nonatomic) IBOutlet UIImageView *draftImage;
@property (strong, nonatomic) IBOutlet UIImageView *sentImage;

@property (strong, nonatomic) IBOutlet UIImageView *junkImage;
@property (strong, nonatomic) IBOutlet UIImageView *trashImage;
@property (strong, nonatomic) IBOutlet UIImageView *archiveImage;

@property (nonatomic, strong) UIAlertView *alert;


@end

@implementation MADMailboxesViewController

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
    
    // Enable the toolbar in table view
    self.navigationController.toolbarHidden = NO;
    
    // Create bar item (including spacer)
    UIBarButtonItem *composeBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(composeAction:)];
    [composeBarButton setStyle:UIBarButtonItemStyleBordered];
 
    
    UIBarButtonItem *fixedSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    fixedSpacer.width = 25;
    
    UIBarButtonItem *lefFlexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *rightFlexSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    // Create label bar item
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 0.0, self.view.frame.size.width, 21.0f)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"Updated 11/12/13 1:30 AM";
    titleLabel.userInteractionEnabled = NO;
    titleLabel.font =[UIFont fontWithName:@"Helvetica-Light" size:12];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UIBarButtonItem *labelBarItem = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    
    // Add all above bar items to toolbar and set center align to label bar item (add fixed and flexible bar item)
    self.toolbarItems = [NSArray arrayWithObjects:fixedSpacer, lefFlexSpacer, labelBarItem, rightFlexSpacer, composeBarButton, nil];
    
    /* Load available bar items in toolbar created by storyboard
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];
    [items addObject:title];
    [self.toolbar setItems:items animated:YES];
     */
    
    // Set tint color for the inboxImage
    UIImage *inboxIcon = self.inboxImage.image;
    // Set the rendering mode to respect tint color
    inboxIcon = [inboxIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.inboxImage.image = inboxIcon;
    self.inboxImage.contentMode = UIViewContentModeScaleAspectFit;
    
   
    // Set tint color for the starImage
    UIImage *starIcon = self.starImage.image;
    // Set the rendering mode to respect tint color
    starIcon = [starIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.starImage.image = starIcon;
    self.starImage.contentMode = UIViewContentModeScaleAspectFit;

    // Set tint color for the draftImage
    UIImage *draftIcon = self.draftImage.image;
    // Set the rendering mode to respect tint color
    draftIcon = [draftIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.draftImage.image = draftIcon;
    self.draftImage.contentMode = UIViewContentModeScaleAspectFit;
    
    
    // Set tint color for the sentImage
    UIImage *sentIcon = self.sentImage.image;
    // Set the rendering mode to respect tint color
    sentIcon = [sentIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.sentImage.image = sentIcon;
    self.sentImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // Set tint color for the junkImage
    UIImage *junkIcon = self.junkImage.image;
    // Set the rendering mode to respect tint color
    junkIcon = [junkIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.junkImage.image = junkIcon;
    self.junkImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // Set tint color for the trashImage
    UIImage *trashIcon = self.trashImage.image;
    // Set the rendering mode to respect tint color
    trashIcon = [trashIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.trashImage.image = trashIcon;
    self.trashImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // Set tint color for the archiveImage
    UIImage *archiveIcon = self.archiveImage.image;
    // Set the rendering mode to respect tint color
    archiveIcon = [archiveIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // And set to the image view
    self.archiveImage.image = archiveIcon;
    self.archiveImage.contentMode = UIViewContentModeScaleAspectFit;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)composeAction:(id)sender
{
    /*
    // Open modal view with navigator item
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    MADSendMailViewController *sendMailController = (MADSendMailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SendMailNavController"];
    // Access through navigation controller (root view controoler of modal view)
    [sendMailController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    sendMailController.navigationController.navigationBarHidden = NO;
    [self.navigationController presentViewController:sendMailController animated:YES completion:nil];
     */
    //if ([MFMessageComposeViewController canSendText]) // The device can send email.

            //{
        [self displayMailComposerSheet];
    //}
    //else  // The device can not send email.
    //{
        
        //self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Device not configured to send SMS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //[self.alert show];
    //}

    
}

- (void)displayMailComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"New Message"];
	
	// Set up recipients
	//NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"];
	//NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
	//NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
	
	//[picker setToRecipients:toRecipients];
	//[picker setCcRecipients:ccRecipients];
	//[picker setBccRecipients:bccRecipients];
	
	// Attach an image to the email
	NSString *path = [[NSBundle mainBundle] pathForResource:@"beer" ofType:@"jpg"];
	NSData *myData = [NSData dataWithContentsOfFile:path];
	[picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"beer"];
	
	// Fill out the email body text
	NSString *emailBody = @"Good news from Apple!";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentViewController:picker animated:YES completion:NULL];
}


- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail sending canceled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.alert show];
            break;
		case MFMailComposeResultSaved:
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.alert show];
            break;
		case MFMailComposeResultSent:
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.alert show];
            break;
		case MFMailComposeResultFailed:
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail sending failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.alert show];
            break;
		default:
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail not sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.alert show];
            break;
	}
    
	//[self dismissViewControllerAnimated:YES completion:NULL];
}

// Get the result of UIAlertView
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // the user clicked Cancel button
    if (buttonIndex == 0)
    {
        [self dismissViewControllerAnimated:YES completion:NULL];
    
    }
}

@end
