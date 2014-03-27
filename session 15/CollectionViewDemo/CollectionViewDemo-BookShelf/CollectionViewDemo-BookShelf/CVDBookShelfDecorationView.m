//
//  CVDBookShelfDecorationView.m
//  CollectionViewDemo-BookShelf
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDBookShelfDecorationView.h"

@interface CVDBookShelfDecorationView()
{
    UIImageView *shelfTexture;
}
@end

@implementation CVDBookShelfDecorationView

+ (NSString *)kind
{
    return @"BookShelfDecorationView";
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImage *background = [[UIImage imageNamed:@"Shelf"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
        shelfTexture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        shelfTexture.image = background;
        [self addSubview:shelfTexture];
    }
    return self;
}

@end
