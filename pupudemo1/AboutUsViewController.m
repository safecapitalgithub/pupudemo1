//
//  AboutUsViewController.m
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController () <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *myWebView;

@end

@implementation AboutUsViewController

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    BOOL result = YES;
    switch (navigationType) {
        case 0: {
            result = NO;
            [[UIApplication sharedApplication] openURL:[request URL]];
            break;
        }
        default:
            break;
    }
	return result;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialViewController
{
	[self setTitle:[Constants MyLocalizedString:@"ABOUT_US_TITLE" defaultIfEmpty:nil]];
	
	NSString *htmlString = @"";
    htmlString = [htmlString stringByAppendingString:@"<html>"];
    htmlString = [htmlString stringByAppendingString:@"<body link='#18a4bd' vlink='#18a4bd' alink='#18a4bd'>"];
    htmlString = [htmlString stringByAppendingString:@"<p style='font-family:Helvetica-Light;color:#515050;font-size:15px;'>"];
    htmlString = [htmlString stringByAppendingString:[Constants MyLocalizedString:@"ABOUT_US_DESC" defaultIfEmpty:nil]];
    htmlString = [htmlString stringByAppendingString:@"</p>"];
    htmlString = [htmlString stringByAppendingString:@"</body>"];
    htmlString = [htmlString stringByAppendingString:@"</html>"];
    [self.myWebView loadHTMLString:htmlString baseURL:nil];
    UIView * v = [[self.myWebView subviews] lastObject];
    if([v isKindOfClass:[UIScrollView class] ]) {
        UIScrollView *scrollView = (UIScrollView *)v;
        [scrollView setScrollEnabled:NO];
        [scrollView setBounces:NO];
    }

}

@end
