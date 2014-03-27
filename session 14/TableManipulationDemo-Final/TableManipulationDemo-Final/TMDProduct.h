//
//  TMDProduct.h
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/22/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDProduct : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSNumber *yearIntroduced;
@property (nonatomic) NSNumber *introPrice;


@end
