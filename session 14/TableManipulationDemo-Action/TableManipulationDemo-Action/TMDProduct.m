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

/*- (id)init:(NSString *)type name:(NSString *)name year:(NSNumber *)year price:(NSNumber *)price
{
	self = [super init];
	self.type = type;
	self.name = name;
    self.yearIntroduced = year;
    self.introPrice = price;
    
	return self;
}*/


#pragma mark - Archiving

static NSString *NameKey = @"NameKey";
static NSString *TypeKey = @"TypeKey";
static NSString *YearKey = @"YearKey";
static NSString *PriceKey = @"PriceKey";

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:NameKey];
        _type = [aDecoder decodeObjectForKey:TypeKey];
        _yearIntroduced = [aDecoder decodeObjectForKey:YearKey];
        _introPrice = [aDecoder decodeObjectForKey:PriceKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:NameKey];
    [aCoder encodeObject:self.type forKey:TypeKey];
    [aCoder encodeObject:self.yearIntroduced forKey:YearKey];
    [aCoder encodeObject:self.introPrice forKey:PriceKey];
}

@end
