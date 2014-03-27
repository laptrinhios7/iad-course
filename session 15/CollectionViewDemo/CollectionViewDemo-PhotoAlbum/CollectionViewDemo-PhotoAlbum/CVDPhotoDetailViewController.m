//
//  CVDPhotoDetailViewController.m
//  CollectionViewDemo-PhotoAlbum
//
//  Created by Vu Tran Lam on 11/20/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDPhotoDetailViewController.h"

@interface CVDPhotoDetailViewController ()

@end

@implementation CVDPhotoDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.image = self.image;
}

@end
