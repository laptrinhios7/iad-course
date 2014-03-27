//
//  CVDCustomCollectionViewController.m
//  CollectionViewDemo-CustomCell
//
//  Created by Vu Tran Lam on 11/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDCustomCollectionViewController.h"
#import "CVDCustomCollectionCell.h"

static NSString *kCollectionViewCellIdentifier = @"Cells";

@interface CVDCustomCollectionViewController ()

@end

@implementation CVDCustomCollectionViewController

- (BOOL)            collectionView:(UICollectionView *)collectionView
  shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (BOOL) collectionView:(UICollectionView *)collectionView
       canPerformAction:(SEL)action
     forItemAtIndexPath:(NSIndexPath *)indexPath
             withSender:(id)sender{
    
    if (action == @selector(copy:)){
        return YES;
    }
    
    return NO;
}

- (void) collectionView:(UICollectionView *)collectionView
          performAction:(SEL)action
     forItemAtIndexPath:(NSIndexPath *)indexPath
             withSender:(id)sender{
    
    if (action == @selector(copy:)){
        
        CVDCustomCollectionCell *cell = (CVDCustomCollectionCell *)[collectionView
                                                              cellForItemAtIndexPath:indexPath];
        
        [[UIPasteboard generalPasteboard]
         setImage:cell.backgroundImageView.image];
        
    }
    
}

- (NSArray *) allImages{
    
    static NSArray *AllSectionImages = nil;
    
    if (AllSectionImages == nil){
        AllSectionImages = @[
                             [UIImage imageNamed:@"One"],
                             [UIImage imageNamed:@"Two"],
                             [UIImage imageNamed:@"Three"]
                             ];
    }
    
    return AllSectionImages;
    
}

- (UIImage *) randomImage{
    return [self allImages][arc4random_uniform([self allImages].count)];
}

- (instancetype) initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithCollectionViewLayout:layout];
    if (self != nil){
        /* Register the nib with the collection view for easy retrieval */
        UINib *nib = [UINib nibWithNibName:
                      NSStringFromClass([CVDCustomCollectionCell class])
                                    bundle:[NSBundle mainBundle]];
        
        [self.collectionView registerNib:nib
              forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
    }
    return self;
    
}

- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInCollectionView
:(UICollectionView *)collectionView{
    /* Between 3 to 6 sections */
    return 3 + arc4random_uniform(4);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    /* Each section has between 10 to 15 cells */
    return 10 + arc4random_uniform(6);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CVDCustomCollectionCell *cell =
    [collectionView
     dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier
     forIndexPath:indexPath];
    
    cell.backgroundImageView.image = [self randomImage];
    cell.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;
    
}

@end
