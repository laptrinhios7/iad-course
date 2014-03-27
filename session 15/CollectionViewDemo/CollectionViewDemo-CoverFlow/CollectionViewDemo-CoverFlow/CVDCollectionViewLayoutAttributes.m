//
//  CVDCollectionViewLayoutAttributes.m
//  CollectionViewDemo-CoverFlow
//
//  Created by Vu Tran Lam on 11/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "CVDCollectionViewLayoutAttributes.h"

@implementation CVDCollectionViewLayoutAttributes

-(id)copyWithZone:(NSZone *)zone
{
    CVDCollectionViewLayoutAttributes *attributes = [super copyWithZone:zone];
    
    attributes.shouldRasterize = self.shouldRasterize;
    attributes.maskingValue = self.maskingValue;
    
    return attributes;
}

@end
