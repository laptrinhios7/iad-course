//
//  TMDProduct.m
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/22/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProduct.h"

@implementation TMDProduct

- (id)init
{
    self = [super init];
    return self;
}




#pragma mark - Archiving

static NSString *NameKey = @"NameKey";
static NSString *CategoryKey = @"CategoryKey";
static NSString *YearKey = @"YearKey";
static NSString *PriceKey = @"PriceKey";

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:NameKey];
        _category = [aDecoder decodeObjectForKey:CategoryKey];
        _yearIntroduced = [aDecoder decodeObjectForKey:YearKey];
        _introPrice = [aDecoder decodeObjectForKey:PriceKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:NameKey];
    [aCoder encodeObject:self.category forKey:CategoryKey];
    [aCoder encodeObject:self.yearIntroduced forKey:YearKey];
    [aCoder encodeObject:self.introPrice forKey:PriceKey];
}

@end
