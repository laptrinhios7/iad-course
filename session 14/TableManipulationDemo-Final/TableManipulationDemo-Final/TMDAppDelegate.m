//
//  TMDAppDelegate.m
//  TableManipulationDemo-Final
//
//  Created by Vu Tran Lam on 10/27/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "TMDAppDelegate.h"
#import "TMDProduct.h"
#import "TMDProductsViewController.h"
#import "TMDCategoriesViewController.h"

@implementation TMDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Create default data for productArray
    NSMutableArray *productArray = [[NSMutableArray alloc] init];

    TMDProduct *product1 =  [[TMDProduct alloc] init];
    product1.category = @"iPhone";
    product1.name = @"iPhone 5";
    product1.yearIntroduced = [NSNumber numberWithInteger:2012];
    product1.introPrice = [NSNumber numberWithDouble:599];
    
    [productArray addObject:product1];
    
    TMDProduct *product2 =  [[TMDProduct alloc] init];
    product2.category = @"iPhone";
    product2.name = @"iPhone 5s";
    product2.yearIntroduced = [NSNumber numberWithInteger:2013];
    product2.introPrice = [NSNumber numberWithDouble:699];
    
    [productArray addObject:product2];
    
    TMDProduct *product3 =  [[TMDProduct alloc] init];
    product3.category = @"iPhone";
    product3.name = @"iPhone 5c";
    product3.yearIntroduced = [NSNumber numberWithInteger:2013];
    product3.introPrice = [NSNumber numberWithDouble:599];
    
    [productArray addObject:product3];
    
    TMDProduct *product4 =  [[TMDProduct alloc] init];
    product4.category = @"iPad";
    product4.name = @"iPad Air";
    product4.yearIntroduced = [NSNumber numberWithInteger:2013];
    product4.introPrice = [NSNumber numberWithDouble:699];
    
    [productArray addObject:product4];
    
    TMDProduct *product5 =  [[TMDProduct alloc] init];
    product5.category = @"iPad";
    product5.name = @"iPad Mini";
    product5.yearIntroduced = [NSNumber numberWithInteger:2013];
    product5.introPrice = [NSNumber numberWithDouble:499];
    
    [productArray addObject:product5];
    
    TMDProduct *product6 =  [[TMDProduct alloc] init];
    product6.category = @"Mac";
    product6.name = @"MacBook Pro 15-inch";
    product6.yearIntroduced = [NSNumber numberWithInteger:2013];
    product6.introPrice = [NSNumber numberWithDouble:1999];
    
    [productArray addObject:product6];
    
    // Acess the TMDProductsViewController and assign products property to productArray
    UINavigationController *navigationController = (UINavigationController *)[self.window rootViewController];
    TMDProductsViewController *viewController = [navigationController.viewControllers objectAtIndex:0];
    viewController.products = productArray;
    

    // Create the default data for categoryArray
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    [categoryArray addObject:@"iPhone"];
    [categoryArray addObject:@"iPad"];
    [categoryArray addObject:@"Mac"];
    
    // Add categoryArray as object to NSUserDefaults with key name
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:categoryArray forKey:@"categoryArray"];
    [userDefaults synchronize];

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
