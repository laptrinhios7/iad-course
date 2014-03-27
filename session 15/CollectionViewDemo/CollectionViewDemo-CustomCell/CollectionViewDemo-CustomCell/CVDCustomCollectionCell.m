//
//  CVDCustomCollectionCell.m
//  CollectionViewDemo-CustomCell
//
//  Created by Vu Tran Lam on 11/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDCustomCollectionCell.h"

@implementation CVDCustomCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundView = [[UIView alloc]initWithFrame:self.bounds];
    self.selectedBackgroundView.backgroundColor = [UIColor blueColor];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
