//
//  THDResponderMethodsViewController.m
//  TouchesHandlingDemo
//
//  Created by Vu Tran Lam on 12/7/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "THDResponderMethodsViewController.h"

@interface THDResponderMethodsViewController ()
{
	BOOL piecesOnTop;  // Keeps track of whether two or more pieces are on top of each other.
	CGPoint startTouchPosition;
}

// Views the user can move
@property (nonatomic, strong) IBOutlet UIImageView *firstPieceView;
@property (strong, nonatomic) IBOutlet UILabel *touchPhaseText;
@property (strong, nonatomic) IBOutlet UILabel *touchLocationText;


@end


@implementation THDResponderMethodsViewController

#pragma mark - Touch handling

// Handles the start of a touch.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.touchPhaseText.text = NSLocalizedString(@"Phase: Touches began", @"Phase label text for touches began");
        UITouch *touch = [[event allTouches] anyObject];
	CGPoint position = [touch locationInView:touch.view];
	self.firstPieceView.center = position;
   
    self.touchLocationText.text =  [NSString stringWithFormat:@"Location x: %0.1f, y: %0.1f", position.x, position.y];
}

// Handles the continuation of a touch.
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    self.touchPhaseText.text = NSLocalizedString(@"Phase: Touches moved", @"Phase label text for touches moved");
    [self touchesBegan:touches withEvent:event];
}

// Handles the end of a touch event.
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.touchPhaseText.text = NSLocalizedString(@"Phase: Touches ended", @"Phase label text for touches ended");
}

// Handles touch event cancel.
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.touchPhaseText.text = NSLocalizedString(@"Phase: Touches cancelled", @"Phase label text for touches cancelled");
}

@end
