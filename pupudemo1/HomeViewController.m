//
//  HomeViewController.m
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "NewsListViewController.h"
#import "AboutUsViewController.h"

@interface HomeViewController () <SWRevealViewControllerDelegate>

@property (nonatomic, strong) SWRevealViewController *revealController;
@property (nonatomic, strong) IBOutlet UIView *baseView;
@property (nonatomic, strong) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, strong) IBOutlet UIView *content00;
@property (nonatomic, strong) IBOutlet UIView *content10;
@property (nonatomic, strong) IBOutlet UIView *content11;
@property (nonatomic, strong) IBOutlet UIView *content20;
@property (nonatomic, strong) IBOutlet UIView *content30;

@end

@implementation HomeViewController

#pragma mark SWRevealViewControllerDelegate protocol
- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    if ( position == FrontViewPositionLeft ) {
        NSLog(@"didMoveToPosition - FrontViewPositionLeft");
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    } else if ( position == FrontViewPositionRight ) {
        NSLog(@"didMoveToPosition - FrontViewPositionRight");
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    } else if ( position == FrontViewPositionRightMost ) {
        NSLog(@"didMoveToPosition - FrontViewPositionRightMost");
    } else if ( position == FrontViewPositionRightMostRemoved ) {
        NSLog(@"didMoveToPosition - FrontViewPositionRightMostRemoved");
    }
}

#pragma mark MenuViewControllerDelegate protocol
- (void)handleDidSelectRow:(NSIndexPath *)indexPath;
{
	switch (indexPath.section) {
		case 0: {
			break;
		}
		case 1: {
			switch (indexPath.row) {
				case 0: {
					// 討論區
					[self.revealController revealToggleAnimated:YES];
					UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Not yet ready" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					break;
				}
				case 1: {
					// 高手排行榜
					[self.revealController revealToggleAnimated:YES];
					UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Not yet ready" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					break;
				}
				case 2: {
					// 普普小秘书
					[self.revealController revealToggleAnimated:YES];
					NewsListViewController *newsListViewController = [[NewsListViewController alloc]init];
					[self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
					[self.navigationController pushViewController:newsListViewController animated:YES];
					break;
				}
				default:
					break;
			}
			
			break;
		}
		case 2: {
			switch (indexPath.row) {
				case 0: {
					// 個人中心
					[self.revealController revealToggleAnimated:YES];
					UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Not yet ready" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					break;
				}
				case 1: {
					// 消息中心
					[self.revealController revealToggleAnimated:YES];
					UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Not yet ready" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					break;
				}
				case 2: {
					// 意見反饋
					[self.revealController revealToggleAnimated:YES];
					UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Not yet ready" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					break;
				}
				case 3: {
					// 關於我們
					[self.revealController revealToggleAnimated:YES];
					AboutUsViewController *aboutUsViewController = [[AboutUsViewController alloc] init];
					[self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
					[self.navigationController pushViewController:aboutUsViewController animated:YES];
					break;
				}
				default:
					break;
			}
			break;
		}
		default:
			break;
	}
}

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	
    [self.revealController enablePanGestureRecognizer:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.revealController enablePanGestureRecognizer:NO];
}

- (void)viewDidLayoutSubviews
{
	CGRect frame = self.baseView.frame;
	[self.contentScrollView setFrame:frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialViewController
{
	[self setTitle:@"首页"];
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"but_menu"] style:UIBarButtonItemStyleBordered target:self action:@selector(myRevealToggle:)];
    [self.navigationItem setLeftBarButtonItem:revealButtonItem];
	
    self.revealController = [self revealViewController];
    [self.revealController setDelegate:self];
    [self.revealController panGestureRecognizer];
	
	MyTapGestureRecognizer *tapRecognizer00 = [[MyTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[tapRecognizer00 setMyTag:@"00"];
	[self.content00 addGestureRecognizer:tapRecognizer00];
	[self.content00.layer setCornerRadius:8.0f];
	
	MyTapGestureRecognizer *tapRecognizer10 = [[MyTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[tapRecognizer10 setMyTag:@"10"];
	[self.content10 addGestureRecognizer:tapRecognizer10];
	[self.content10.layer setCornerRadius:8.0f];

	MyTapGestureRecognizer *tapRecognizer11 = [[MyTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[tapRecognizer11 setMyTag:@"10"];
	[self.content11 addGestureRecognizer:tapRecognizer11];
	[self.content11.layer setCornerRadius:8.0f];
	
	MyTapGestureRecognizer *tapRecognizer20 = [[MyTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[tapRecognizer20 setMyTag:@"20"];
	[self.content20 addGestureRecognizer:tapRecognizer20];
	[self.content20.layer setCornerRadius:8.0f];
	
	MyTapGestureRecognizer *tapRecognizer30 = [[MyTapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[tapRecognizer30 setMyTag:@"20"];
	[self.content30 addGestureRecognizer:tapRecognizer30];
	[self.content30.layer setCornerRadius:8.0f];
	
	[self.baseView addSubview:self.contentScrollView];
}

- (void)myRevealToggle:(id)sender
{
    [self.revealController revealToggle:sender];
}

- (void)handleTap:(MyTapGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateEnded) {
        // handling code
		if ([@"00" isEqualToString:sender.myTag]) {
			// tap content00
			NSLog(@"tap content00");
		} else if ([@"10" isEqualToString:sender.myTag]) {
			// tap content10
			NSLog(@"tap content10");
		} else if ([@"11" isEqualToString:sender.myTag]) {
			// tap content11
			NSLog(@"tap content11");
		} else if ([@"20" isEqualToString:sender.myTag]) {
			// tap content20
			NSLog(@"tap content20");
		} else if ([@"30" isEqualToString:sender.myTag]) {
			// tap content30
			NSLog(@"tap content30");
		}
    }
}


@end
