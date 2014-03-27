//
//  CVDBookCell.m
//  CollectionViewDemo-BookShelf
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDBookCell.h"

@implementation CVDBookCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    if (self)
    {
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.f
                                                              green:arc4random_uniform(256)/255.f
                                                               blue:arc4random_uniform(256)/255.f
                                                              alpha:1];
        
    }
    return self;
}

+ (NSString *)reuseId
{
    return @"BookCellId";
}

@end
