//
//  AppDelegate.m
//  Unit3.1
//
//  Created by fukutarohori on 07/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "TopMenuController.h"
#import "TopPageViewController.h"

@implementation AppDelegate {
    UIViewController *_rootController;
@private
    UIViewController *_viewController1;
    UIViewController *_viewController2;
    UIViewController *_topPageViewController;
}


@synthesize window = _window;
@synthesize viewController1 = _viewController1;
@synthesize viewController2 = _viewController2;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    // selfMake
    //CGRect bounds = [[UIScreen mainScreen] bounds];
    //_window = [[UIWindow alloc] initWithFrame:bounds];

    /*
    // 3.1
    _rootController = [[UITabBarController alloc] init];
    ViewController1 *tab1 = [[ViewController1 alloc] init];
    ViewController2 *tab2 = [[ViewController2 alloc] init];
    */

    _topPageViewController = [[TopPageViewController alloc] init];
    //_topPageViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [_window addSubview:_topPageViewController.view];

    // 3.2
    TopMenuController *topMenu = [[TopMenuController alloc] init];
    _rootController = [[UINavigationController alloc] initWithRootViewController:topMenu];

    // ViewControllerをControllerにまとめて追加
    /*
    NSArray *controllers = [NSArray arrayWithObjects:tab1,tab2, nil];
    [(UITabBarController *)_rootController setViewControllers:controllers animated:NO];
    */
    [_window addSubview:_rootController.view];

    /*
    _viewController1 = [[ViewController1 alloc] init];
    _viewController2 = [[ViewController2 alloc] init];
    [_window addSubview:_viewController1.view];
    [_window addSubview:_viewController2.view];
    // ViewController2のほうを前面に
    [_window bringSubviewToFront:_viewController2.view];
    */
    [_window bringSubviewToFront:_topPageViewController.view];

    [self.window makeKeyAndVisible];
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
