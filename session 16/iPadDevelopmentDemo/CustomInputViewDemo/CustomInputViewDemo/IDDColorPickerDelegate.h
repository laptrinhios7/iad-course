//
//  IDDColorPickerDelegate.h
//  PopoverControllerDemo
//
//  Created by Vu Tran Lam on 12/14/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDDColorPickerDelegate <NSObject>

@required
- (void)selectedColor:(UIColor *)newColor;

@end
