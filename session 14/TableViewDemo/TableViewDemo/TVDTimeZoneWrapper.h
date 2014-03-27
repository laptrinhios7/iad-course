//
//  TVDTimeZoneWrapper.h
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/19/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVDTimeZoneWrapper : NSObject



@property (nonatomic) NSString *timeZoneLocaleName;
@property (nonatomic) NSTimeZone *timeZone;

@property (nonatomic) NSDate *date;
@property (nonatomic) NSCalendar *calendar;

@property (readonly, nonatomic) NSString *whichDay;
@property (readonly, nonatomic) NSString *abbreviation;
@property (readonly, nonatomic) NSString *gmtOffset;
@property (readonly, nonatomic) UIImage *image;

- (instancetype)initWithTimeZone:(NSTimeZone *)aTimeZone nameComponents:(NSArray *)nameComponents;


@end
