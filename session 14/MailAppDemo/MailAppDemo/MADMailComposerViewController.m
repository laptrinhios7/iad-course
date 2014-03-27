//
//  MADMailComposerViewController.m
//  MailAppDemo
//
//  Created by Vu Tran Lam on 11/9/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <MessageUI/MessageUI.h>

#import "MADMailComposerViewController.h"

@interface MADMailComposerViewController () <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) UIAlertView *alert;

@end

@implementation MADMailComposerViewController

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
    //[super viewDidLoad];
	// Do any additional setup after loading the view.
    if ([MFMailComposeViewController canSendMail])
        // The device can send email.
    {
        [self displayMailComposerSheet];
    }
    else
        // The device can not send email.
    {
        //self.feedbackMsg.hidden = NO;
		//self.feedbackMsg.text = @"Device not configured to send mail.";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail Information" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        
    }

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
	NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"jpg"];
	NSData *myData = [NSData dataWithContentsOfFile:path];
	[picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"rainy"];
	
	// Fill out the email body text
	NSString *emailBody = @"It is raining in sunny California!";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentViewController:picker animated:YES completion:NULL];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	//self.feedbackMsg.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			//self.feedbackMsg.text = @"Result: Mail sending canceled";
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail Information" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [self.alert show];
            break;
		case MFMailComposeResultSaved:
			//self.feedbackMsg.text = @"Result: Mail saved";
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail Information" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [self.alert show];
            break;
		case MFMailComposeResultSent:
			//self.feedbackMsg.text = @"Result: Mail sent";
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail Information" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [self.alert show];
            break;
		case MFMailComposeResultFailed:
			//self.feedbackMsg.text = @"Result: Mail sending failed";
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail Information" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [self.alert show];
            break;
		default:
			//self.feedbackMsg.text = @"Result: Mail not sent";
            self.alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail Information" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [self.alert show];
            break;
	}
    
	[self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
