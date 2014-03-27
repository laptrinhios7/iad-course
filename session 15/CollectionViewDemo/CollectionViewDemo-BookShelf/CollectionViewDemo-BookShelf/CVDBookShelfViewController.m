//
//  CVDBookShelfViewController.m
//  CollectionViewDemo-BookShelf
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDBookShelfViewController.h"
#import "CVDBookShelfDataSource.h"
#import "CVDBookCell.h"
#import "CVDBookShelfHeaderView.h"
#import "CVDBookShelfLayout.h"

@interface CVDBookShelfViewController ()
{
    CVDBookShelfDataSource *_dataSource;
}
@end

@implementation CVDBookShelfViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataSource = [[CVDBookShelfDataSource alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[CVDBookShelfLayout alloc] init]];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"White-Tweed"]];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = _dataSource;
    
    // register class for cells
    [self.collectionView registerClass:[CVDBookCell class] forCellWithReuseIdentifier:[CVDBookCell reuseId]];
    
    // register class for supplimentary views
    [self.collectionView registerClass:[CVDBookShelfHeaderView class] forSupplementaryViewOfKind:[CVDBookShelfHeaderView kind] withReuseIdentifier:[CVDBookShelfHeaderView reuseId]];
    
}

@end
