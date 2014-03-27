//
//  CVDPhotoModel.m
//  CollectionViewDemo-CoverFlow
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDPhotoModel.h"

@implementation CVDPhotoModel

+(instancetype)photoModelWithImage:(UIImage *)image
{
    CVDPhotoModel *model = [[CVDPhotoModel alloc] init];
    
    model.image = image;
    
    return model;
}

@end
