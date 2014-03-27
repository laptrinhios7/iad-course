//
//  TMDAppDelegate.m
//  TableManipulationDemo
//
//  Created by Vu Tran Lam on 10/22/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDAppDelegate.h"
#import "TMDProduct.h"
#import "TMDProductsViewController.h"

@implementation TMDAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSMutableArray *productArray = [[NSMutableArray alloc] init];
    
    TMDProduct *product1 =  [[TMDProduct alloc] init];
    product1.type = @"iPhone";
    product1.name = @"iPhone 5";
    product1.yearIntroduced = [NSNumber numberWithInteger:2007];
    product1.introPrice = [NSNumber numberWithDouble:599.00];
    
    [productArray addObject:product1];
    
    /*[TMDProduct productWithType:@"Device"
                                                     name:@"iPod"
                                                     year:[NSNumber numberWithInteger:2001]
                                                    price:[NSNumber numberWithDouble:399.00]],
                              [TMDProduct productWithType:@"Device"
                                                     name:@"iPod touch"
                                                     year:[NSNumber numberWithInteger:2007]
                                                     price:[NSNumber numberWithDouble:659.00]],
                            [TMDProduct productWithType:@"Device"
                                                     name:@"iPad"
                                                     year:[NSNumber numberWithInteger:2010]
                                                    price:[NSNumber numberWithDouble:499.00]],
                              [TMDProduct productWithType:@"Device"
                                                     name:@"iPad mini"
                                                     year:[NSNumber numberWithInteger:2012]
                                                    price:[NSNumber numberWithDouble:659.00]],
                              [TMDProduct productWithType:@"Desktop"
                                                     name:@"iMac"
                                                     year:[NSNumber numberWithInteger:1997]
                                                    price:[NSNumber numberWithDouble:1299.00]],
                              [TMDProduct productWithType:@"Desktop"
                                                     name:@"Mac Pro"
                                                     year:[NSNumber numberWithInteger:2006]
                                                    price:[NSNumber numberWithDouble:2499.00]],
                              [TMDProduct productWithType:@"Portable"
                                                     name:@"MacBook Air"
                                                     year:[NSNumber numberWithInteger:2008]
                                                    price:[NSNumber numberWithDouble:1799.00]],
                              [TMDProduct productWithType:@"Portable"
                                                     name:@"MacBook Pro"
                                                     year:[NSNumber numberWithInteger:2006]
                                                    price:[NSNumber numberWithDouble:1499.00]]
                              ];*/
    
    UINavigationController *navigationController = (UINavigationController *)[self.window rootViewController];
    TMDProductsViewController *viewController = [navigationController.viewControllers objectAtIndex:0];
    viewController.products = productArray;
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
