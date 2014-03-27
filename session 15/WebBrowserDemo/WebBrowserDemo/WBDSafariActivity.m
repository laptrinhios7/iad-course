//
//  WBDSafariActivity.m
//  WebBrowserDemo
//
//  Created by Vu Tran Lam on 12/3/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "WBDSafariActivity.h"

@interface WBDSafariActivity ()

@property (strong, nonatomic) NSURL *URL;

@end

@implementation WBDSafariActivity

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
    return @"Open in Safari";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"Activity"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem]) {
            return YES;
        }
    }
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSURL class]]) {
            self.URL = activityItem;
            return;
        }
    }
}

- (void)performActivity
{
    [[UIApplication sharedApplication] openURL:self.URL];
    [self activityDidFinish:YES];
}

@end
