//
//  IDDMonsterSelectionDelegate.h
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDDMonster;

@protocol IDDMonsterSelectionDelegate <NSObject>

@required
- (void)selectedMonster:(IDDMonster *)monster;

@end
