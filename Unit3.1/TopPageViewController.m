//
//  TopPageViewController.m
//  Unit3.1
//
//  Created by fukutarohori on 07/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopPageViewController.h"
#import "FBConnect.h"
#import "TopMenuController.h"

@interface TopPageViewController ()<UIApplicationDelegate,FBSessionDelegate>{
    //Facebook *facebook;
}
@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) NSArray *permissions;
@end


@implementation TopPageViewController{
    TopMenuController *_topMenuController;
@private
    NSArray *_permissions;
}
@synthesize facebook;
@synthesize permissions = _permissions;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"topage";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    facebook = [[Facebook alloc] initWithAppId:@"166560493473733" andDelegate:self];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] && [defaults objectForKey:@"FBExpirationDateKey"]){
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }



    // トップページパーツ
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"Welcome to fablap!";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor orangeColor];
    label.textColor = [UIColor whiteColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];

    /*
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    [button setTitle:@"Go Top!" forState:UIControlStateNormal];
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
    */

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat xLoginButtonOffset = self.view.center.x - (318/2);
    CGFloat yLoginButtonOffset = self.view.bounds.size.height - (58 + 13);
    button.frame = CGRectMake(xLoginButtonOffset, yLoginButtonOffset, 318, 58);
    [button setImage:[UIImage imageNamed:@"LoginWithFacebookNormal@2x.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"LoginWithFacebookPressed@2x.png"] forState:UIControlStateHighlighted];

    [button sizeToFit];
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}



-(void)buttonDidPush{
    //_permissions = [[NSArray alloc] initWithObjects:@"user_likes",@"read_stream",nil];
    //[facebook authorize:_permissions];
    NSLog(@"login");
    //[self.view removeFromSuperview];
    if ([facebook isSessionValid] == NO){
        [facebook authorize:_permissions];
    } else{
        [self fbDidLogin];
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    facebook = [[Facebook alloc] initWithAppId:@"166560493473733" andDelegate:self];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] && [defaults objectForKey:@"FBExpirationDateKey"]){
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    if (![facebook isSessionValid]){
        [facebook authorize:nil];
    }

    return YES;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [facebook handleOpenURL:url];
}
*/

- (void)fbDidLogin {
    NSLog(@"fbDidLogin");
    [self.view removeFromSuperview];
}


@end
