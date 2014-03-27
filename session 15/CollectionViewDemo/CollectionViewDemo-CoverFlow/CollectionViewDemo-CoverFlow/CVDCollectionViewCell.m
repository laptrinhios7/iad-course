//
//  CVDCollectionViewCell.m
//  CollectionViewDemo-CoverFlow
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDCollectionViewCell.h"
#import "CVDCollectionViewLayoutAttributes.h"

@implementation CVDCollectionViewCell
{
    UIImageView *imageView;
    UIView *maskView;
}

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    // Set up our image view
    imageView = [[UIImageView alloc] initWithFrame:CGRectInset(CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)), 10, 10)];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];
    
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    maskView.alpha = 0.0f;
    [self.contentView insertSubview:maskView aboveSubview:imageView];
    
    // This will make the rest of our cell, outside the image view, appear transparent against a black background.
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

#pragma mark - Overridden Methods

-(void)prepareForReuse
{
    [super prepareForReuse];
    
    [self setImage:nil];
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    maskView.alpha = 0.0f;
    self.layer.shouldRasterize = NO;
    
    // Important! Check to make sure we're actually this special subclass.
    // Failing to do so could cause the app to crash!
    if (![layoutAttributes isKindOfClass:[CVDCollectionViewLayoutAttributes class]])
    {
        return;
    }
    
    CVDCollectionViewLayoutAttributes *castedLayoutAttributes = (CVDCollectionViewLayoutAttributes *)layoutAttributes;
    
    self.layer.shouldRasterize = castedLayoutAttributes.shouldRasterize;
    maskView.alpha = castedLayoutAttributes.maskingValue;
}

#pragma mark - Public Methods

-(void)setImage:(UIImage *)image
{
    [imageView setImage:image];
}

@end
