//
//  CVDSimpleCollectionViewController.m
//  CollectionViewDemo-Simple
//
//  Created by Vu Tran Lam on 11/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDSimpleCollectionViewController.h"

static NSString *kCollectionViewIdentifier = @"Cells";

@interface CVDSimpleCollectionViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CVDSimpleCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UICollectionViewFlowLayout *) flowLayout
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 20.0f;
    flowLayout.minimumInteritemSpacing = 10.0f;
    flowLayout.itemSize = CGSizeMake(80.0f, 120.0f);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(10.0f, 20.0f, 10.0f, 20.0f);
    return flowLayout;
}

- (NSArray *)allSectionColors
{
    static NSArray *allSecitonColors = nil;
    if (allSecitonColors == nil)
    {
        allSecitonColors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
        
    }
    return allSecitonColors;
    
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self != nil)
    {
        // Register the cell with the collection view for easy retrieval
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewIdentifier];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // Generate between 20 - 40 cells for each section
    
    return 6; //20 + arc4random_uniform(21);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3; //[self allSectionColors].count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Custom cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewIdentifier forIndexPath:indexPath];
    // Add image view,...
    cell.backgroundColor = [self allSectionColors][indexPath.section];
    return cell;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
