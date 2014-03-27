//
//  TMDProduct.m
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/22/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDProduct.h"

NSString *iPhoneType = @"iPhone";
NSString *iPadType = @"iPad";
NSString *MacBookType = @"MacBook";

@implementation TMDProduct

- (id)init
{
    self = [super init];
    return self;
}

+ (NSArray *)deviceTypeNames
{
    static NSArray *deviceTypeNames = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        deviceTypeNames = @[iPhoneType, iPadType, MacBookType];
    });
    
    return deviceTypeNames;
}

+ (NSString *)displayNameForType:(NSString *)type
{
    static NSMutableDictionary *deviceTypeDisplayNamesDictionary = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        deviceTypeDisplayNamesDictionary = [[NSMutableDictionary alloc] init];
        for (NSString *deviceType in self.deviceTypeNames)
        {
            NSString *displayName = NSLocalizedString(deviceType, @"dynamic");
            deviceTypeDisplayNamesDictionary[deviceType] = displayName;
        }
    });
    return deviceTypeDisplayNamesDictionary[type];
}


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
