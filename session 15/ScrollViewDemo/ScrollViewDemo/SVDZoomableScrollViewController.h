//
//  SVDZoomableScrollViewController.h
//  ScrollViewDemo
//
//  Created by Vu Tran Lam on 11/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVDZoomableScrollViewController : UIViewController  <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

- (void)centerScrollViewContent;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer *)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer *)recognizer;

@end
