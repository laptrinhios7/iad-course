//
//  TVDTimeZoneCell.h
//  TableViewDemo
//
//  Created by Vu Tran Lam on 10/21/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVDTimeZoneCell : UITableViewCell
@property (nonatomic, weak, readonly) UILabel *nameLabel;
@property (nonatomic, weak, readonly) UILabel *timeLabel;
@property (nonatomic, weak, readonly) UIImageView *timeImageView;

@end
