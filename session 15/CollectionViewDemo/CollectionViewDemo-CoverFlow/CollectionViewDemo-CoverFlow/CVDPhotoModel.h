//
//  CVDPhotoModel.h
//  CollectionViewDemo-CoverFlow
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVDPhotoModel : NSObject

+(instancetype)photoModelWithImage:(UIImage *)image;

@property (nonatomic, strong) UIImage *image;

@end
