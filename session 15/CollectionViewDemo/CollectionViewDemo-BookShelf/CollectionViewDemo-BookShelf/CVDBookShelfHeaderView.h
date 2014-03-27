//
//  CVDBookShelfHeaderView.h
//  CollectionViewDemo-BookShelf
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVDBookShelfHeaderView : UICollectionReusableView

+ (NSString *)kind;
+ (NSString *)reuseId;

@property (nonatomic, copy) NSString *shelfName;
@property (nonatomic, assign) int shelfCount;

@end
