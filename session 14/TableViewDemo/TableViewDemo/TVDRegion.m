//
//  TVDRegion.m
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TVDRegion.h"

static NSMutableDictionary *regions;

@interface TVDRegion()

@property (nonatomic) NSMutableArray *mutableTimeZoneWrappers;

@end

@implementation TVDRegion

static NSMutableArray *knownRegions = nil;


+ (NSArray *)knownRegions {
	
	if (knownRegions == nil) {
		[self setUpKnownRegions];
	}
	return knownRegions;
	
}


-(NSArray *)timeZoneWrappers {
    return _mutableTimeZoneWrappers;
}

+ (instancetype)newRegionWithName:(NSString *)regionName {
    // Create a new region with a given name; add it to the regions dictionary.
	TVDRegion *newRegion = [[self alloc] init];
	newRegion.name = regionName;
	newRegion.mutableTimeZoneWrappers = [[NSMutableArray alloc] init];
	regions[regionName] = newRegion;
	return newRegion;
}

#pragma mark -  Private methods for setting up the regions.

- (instancetype)initWithName:(NSString *)regionName {
	
	self = [super init];
    
    if (self) {
		_name = [regionName copy];
		_mutableTimeZoneWrappers = [[NSMutableArray alloc] init];
	}
	return self;
}


+ (void)setUpKnownRegions {
	
	NSArray *knownTimeZoneNames = [NSTimeZone knownTimeZoneNames];
	
	NSMutableArray *regions = [[NSMutableArray alloc] initWithCapacity:[knownTimeZoneNames count]];
	
	for (NSString *timeZoneName in knownTimeZoneNames) {
		
		NSArray *nameComponents = [timeZoneName componentsSeparatedByString:@"/"];
		NSString *regionName = [nameComponents objectAtIndex:0];
		
		// Get the region  with the region name, or create it if it doesn't exist.
		TVDRegion *region = nil;
		
		for (TVDRegion *aRegion in regions) {
			if ([aRegion.name isEqualToString:regionName]) {
				region = aRegion;
				break;
			}
		}
		
		if (region == nil) {
			region = [[TVDRegion alloc] initWithName:regionName];
			[regions addObject:region];
		}
		
		NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:timeZoneName];
		TVDTimeZoneWrapper *timeZoneWrapper = [[TVDTimeZoneWrapper alloc] initWithTimeZone:timeZone nameComponents:nameComponents];
		[region addTimeZoneWrapper:timeZoneWrapper];
	}
	
	// Sort the time zones by locale name.
    NSSortDescriptor *localeNameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeZoneLocaleName" ascending:YES comparator:^(id name1, id name2) {
        
        return [(NSString *)name1 localizedStandardCompare:(NSString *)name2];
    }];
    
	for (TVDRegion *aRegion in regions) {
        [aRegion.mutableTimeZoneWrappers sortUsingDescriptors:@[localeNameSortDescriptor]];
	}
	
    // Sort the regions by name.
    NSSortDescriptor *nameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES comparator:^(id name1, id name2) {
        
        return [(NSString *)name1 localizedStandardCompare:(NSString *)name2];
    }];
    
    [regions sortUsingDescriptors:@[nameSortDescriptor]];
	
	knownRegions = regions;
}


- (void)addTimeZoneWrapper:(TVDTimeZoneWrapper *)timeZoneWrapper {
	[self.mutableTimeZoneWrappers addObject:timeZoneWrapper];
}


+ (void)initialize {
	regions = [[NSMutableDictionary alloc] init];
}


+ (instancetype)regionNamed:(NSString *)name {
	return regions[name];
}




- (void)addTimeZone:(NSTimeZone *)timeZone nameComponents:(NSArray *)nameComponents {
    // Add a time zone to the region; use nameComponents because it' expensive to compute.
	TVDTimeZoneWrapper *timeZoneWrapper = [[TVDTimeZoneWrapper alloc] initWithTimeZone:timeZone nameComponents:nameComponents];
	timeZoneWrapper.calendar = self.calendar;
	[self.mutableTimeZoneWrappers addObject:timeZoneWrapper];
}


- (void)sortZones {
    // Sort the zone wrappers by locale name.
    NSSortDescriptor *nameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeZoneLocaleName" ascending:YES comparator:^(id name1, id name2) {
        return [(NSString *)name1 localizedStandardCompare:(NSString *)name2];
    }];
    
	[self.mutableTimeZoneWrappers sortUsingDescriptors:@[nameSortDescriptor]];
}


// Sets the date for the time zones, which has the side-effect of "faulting" the wrappers (see APLTimeZoneWrapper's setDate: method)
- (void)setDate:(NSDate *)date {
	for (TVDTimeZoneWrapper *wrapper in self.timeZoneWrappers) {
		wrapper.date = date;
	}
}


@end
