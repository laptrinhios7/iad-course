//
//  IDDAppDelegate.m
//  iPadDevelopmentDemo
//
//  Created by Vu Tran Lam on 12/13/13.
//  Copyright (c) 2013 FPT. All rights reserved.
//

#import "IDDAppDelegate.h"

@implementation IDDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //Figure out that we're on an iPad.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        //Grab a reference to the UISplitViewController
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        
        //Grab a reference to the RightViewController and set it as the SVC's delegate.
        IDDRightContentViewController *rightContentViewController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = rightContentViewController;
        
        //Grab a reference to the LeftViewController and get the first monster in the list.
        UINavigationController *leftNavController = [splitViewController.viewControllers objectAtIndex:0];
        IDDLeftTableViewController *leftTableViewController = (IDDLeftTableViewController *)[leftNavController topViewController];
        IDDMonster *firstMonster = [[leftTableViewController monsters] objectAtIndex:0];
        
        //Set it as the RightViewController's monster.
        [rightContentViewController setMonster:firstMonster];
        
        //Set the RightViewController as the left's delegate.
        leftTableViewController.delegate = rightContentViewController;
    }

    
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
