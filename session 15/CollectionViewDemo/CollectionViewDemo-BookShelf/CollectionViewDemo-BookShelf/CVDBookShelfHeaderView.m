//
//  CVDBookShelfHeaderView.m
//  CollectionViewDemo-BookShelf
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDBookShelfHeaderView.h"

@interface CVDBookShelfHeaderView()
{
    UILabel *_shelfNameLabel;
    UILabel *_shelfCountLabel;
}
@end


@implementation CVDBookShelfHeaderView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _shelfNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 6, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _shelfNameLabel.textAlignment = NSTextAlignmentLeft;
        _shelfNameLabel.textColor = [UIColor blackColor];
        _shelfNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_shelfNameLabel];
        
        _shelfCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 6, CGRectGetWidth(frame)-20, CGRectGetHeight(frame))];
        _shelfCountLabel.textAlignment = NSTextAlignmentRight;
        _shelfCountLabel.textColor = [UIColor grayColor];
        _shelfCountLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_shelfCountLabel];
        
    }
    return self;
}

- (void) setShelfName:(NSString *)shelfName
{
    _shelfName = shelfName;
    _shelfNameLabel.text = _shelfName;
}

- (void)setShelfCount:(int)shelfCount
{
    _shelfCount = shelfCount;
    _shelfCountLabel.text = [NSString stringWithFormat:@"%d Books", _shelfCount];
}

+ (NSString *)kind
{
    return UICollectionElementKindSectionHeader;
}

+ (NSString *)reuseId
{
    return @"BookShelfHeaderViewId";
}

@end
