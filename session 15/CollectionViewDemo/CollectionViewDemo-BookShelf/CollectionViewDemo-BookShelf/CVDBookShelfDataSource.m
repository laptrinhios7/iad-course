//
//  CVDBookShelfDataSource.m
//  CollectionViewDemo-BookShelf
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDBookShelfDataSource.h"
#import "CVDBookCell.h"
#import "CVDBookShelfHeaderView.h"



@interface CVDBookShelfDataSource()
{
    NSArray *_books;
}
@end


@implementation CVDBookShelfDataSource

- (id)init
{
    if (!(self = [super init])) return nil;
    [self generateBooks];
    return self;
}

- (void)generateBooks
{
    // just some simple sample data indicating the number of books in each section
    _books = @[@7, @1, @7, @2, @4, @3];
}

#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [_books count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_books[section] integerValue];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVDBookCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CVDBookCell reuseId] forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CVDBookShelfHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[CVDBookShelfHeaderView reuseId] forIndexPath:indexPath];
    header.shelfName = [NSString stringWithFormat:@"Section %d", indexPath.section + 1];
    header.shelfCount = [_books[indexPath.section] intValue];
    return header;
}

@end
