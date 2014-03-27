//
//  NJKWebViewProgress.h
//
//  Created by Satoshi Aasano on 4/20/13.
//  Copyright (c) 2013 Satoshi Asano. All rights reserved.
//

#import <Foundation/Foundation.h>

#undef njk_weak
#if __has_feature(objc_arc_weak)
#define njk_weak weak
#else
#define njk_weak unsafe_unretained
#endif

typedef void (^WBDWebViewProgressBlock)(float progress);
@protocol WBDWebViewProgressDelegate;

@interface WBDWebViewProgress : NSObject<UIWebViewDelegate>
@property (nonatomic, njk_weak) id<WBDWebViewProgressDelegate>progressDelegate;
@property (nonatomic, njk_weak) id<UIWebViewDelegate>webViewProxyDelegate;
@property (nonatomic, copy) WBDWebViewProgressBlock progressBlock;
@property (nonatomic, readonly) float progress; // 0.0..1.0

- (void)reset;
@end

@protocol WBDWebViewProgressDelegate <NSObject>
- (void)webViewProgress:(WBDWebViewProgress *)webViewProgress updateProgress:(float)progress;
@end

