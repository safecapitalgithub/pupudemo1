//
//  RootViewController.m
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "MenuViewController.h"
#import "SWRevealViewController.h"
#import "MyAccount.h"

@interface RootViewController ()

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *actiityIndicatorView;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[self initialViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialViewController
{
	dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
		//Background Thread
		[NSThread sleepForTimeInterval:2.0];
		dispatch_async(dispatch_get_main_queue(), ^(void){
			//Run UI Updates
			[self.actiityIndicatorView stopAnimating];
			[self goToHomeViewController];
		});
	});
}

- (void)goToHomeViewController
{
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]}];
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
	MyAccount *myAccount = [[MyAccount alloc] init];
	[myAccount setAccountId:@"0001"];
	[myAccount setName:@"用户名"];
	[myAccount setImage:@""];
	
	NSArray *myArray = [[NSArray alloc] initWithObjects:
						[[NSArray alloc] initWithObjects:myAccount, nil],
						[[NSArray alloc] initWithObjects:@"討論區", @"高手排行榜", [Constants MyLocalizedString:@"NEWS_TITLE" defaultIfEmpty:nil], nil],
						[[NSArray alloc] initWithObjects:@"個人中心", @"消息中心", @"意見反饋", @"關於我們", nil],
						nil];

    [menuViewController setDelegate:homeViewController];
	[menuViewController setMyArray:myArray];
    UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
	[frontNavigationController.navigationBar setBarStyle:UIBarStyleBlack];
	[frontNavigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
	[rearNavigationController setNavigationBarHidden:YES];
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    [self presentViewController:mainRevealController animated:NO completion:nil];
}

@end
