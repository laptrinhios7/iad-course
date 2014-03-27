//
//  TVDRegion.h
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVDTimeZoneWrapper.h"

@interface TVDRegion : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSCalendar *calendar;
- (NSArray *)timeZoneWrappers;

+ (instancetype)regionNamed:(NSString *)name;
+ (instancetype)newRegionWithName:(NSString *)regionName;
- (void)addTimeZone:(NSTimeZone *)timeZone nameComponents:(NSArray *)nameComponents;
- (void)sortZones;
- (void)setDate:(NSDate *)date;

+ (NSArray *)knownRegions;
@end
