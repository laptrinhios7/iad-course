//
//  GRDGestureRecognizersViewController.m
//  GestureRecognizersDemo
//
//  Created by Vu Tran Lam on 12/12/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "GRDGestureRecognizersViewController.h"

@interface GRDGestureRecognizersViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;

@end

@implementation GRDGestureRecognizersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if ([self.segmentedControl selectedSegmentIndex] == 0)
    {
        [self.view addGestureRecognizer:self.swipeLeftRecognizer];
    }
    else
    {
        [self.view removeGestureRecognizer:self.swipeLeftRecognizer];
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)takeLeftSwipeRecognizationEnabledFrom:(UISegmentedControl *)segmentedControl
{
    // Add or remove the left swipe recognizer to or from the view depending on the seleciton
    // in the segmented control
    if ([segmentedControl selectedSegmentIndex] == 0)
    {
        [self.view addGestureRecognizer:self.swipeLeftRecognizer];
    }
    else
    {
        [self.view removeGestureRecognizer:self.swipeLeftRecognizer];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // Disallow recognization of tap gestures in the segmented control
    if ((touch.view == self.segmentedControl) && (gestureRecognizer == self.tapRecognizer))
    {
        return NO;
    }
    return YES;
}

#pragma mark Responding to gestures

// In response to a tap gesture, show the image view approriate then make it fade out in place
- (IBAction)showGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self.view];
    [self drawImageForGestureRecognizer:recognizer atPoint:location];
    
    [UIView animateWithDuration:0.5 animations:^
    {
        self.imageView.alpha = 0.0;
    }];
    
}


// In response to a swipe gesture, show the image view approriate then move the image view in the direction of the swipes as it fades out
- (IBAction)showGestureForSwipeRecognizer:(UISwipeGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self.view];
    [self drawImageForGestureRecognizer:recognizer atPoint:location];
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        location.x -= 100.0;
    }
    else
    {
        location.x += 100.0;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.alpha = 0.0;
        self.imageView.center = location;
    }];
}


// In response to a rotation gesture, show the image view at the rotation given by the cecognizer.
// At the end of the gesture, make image fade out in place while rotating back to horizontal.
- (IBAction)showGestureForRotationRecognizer:(UIRotationGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self.view];
    CGAffineTransform transform = CGAffineTransformMakeRotation([recognizer rotation]);
    self.imageView.transform = transform;
    [self drawImageForGestureRecognizer:recognizer atPoint:location];
    
    // If the gesture has ended or is cancelled, begin the animation back to horizontal and fade out
    if (([recognizer state] == UIGestureRecognizerStateEnded) || ([recognizer state] == UIGestureRecognizerStateCancelled))
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.imageView.alpha = 0.0;
            self.imageView.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark Drawing the image view

// Set the approriate image for the image view for the given gesture recognizer,
// move the image view to the give point, then display the image view by setting its alpha to 1.0
- (void)drawImageForGestureRecognizer:(UIGestureRecognizer *)recognizer atPoint:(CGPoint)centerPoint
{
    NSString *imageName;
    if ([recognizer isMemberOfClass:[UITapGestureRecognizer class]])
    {
        imageName = @"tap";
    }
    else if ([recognizer isMemberOfClass:[UIRotationGestureRecognizer class]])
    {
        imageName = @"rotation";
    }
    else if ([recognizer isMemberOfClass:[UISwipeGestureRecognizer class]])
    {
        imageName = @"swipe";
    }
    
    self.imageView.image = [UIImage imageNamed:imageName];
    self.imageView.center = centerPoint;
    self.imageView.alpha = 1.0;
    
}




@end
