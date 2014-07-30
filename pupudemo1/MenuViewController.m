//
//  MenuViewController.m
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import "MenuViewController.h"
#import "MyAccount.h"

static NSString *kMenuViewControllerCellID1 = @"MenuViewControllerCell1";
static NSString *kMenuViewControllerCellID2 = @"MenuViewControllerCell2";

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *myTableView;

@end

@implementation MenuViewController

#pragma mark UITableViewDataSource protocol
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [self.myArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[self.myArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = nil;
	NSObject *obj = [[self.myArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	if ([obj isKindOfClass:[MyAccount class]]) {
		cell = [tableView dequeueReusableCellWithIdentifier:kMenuViewControllerCellID1];
		
		// Configure the cell...
		if (cell == nil) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMenuViewControllerCellID1];
			[cell setBackgroundColor:[UIColor clearColor]];
		}
		
		MyAccount *myAccount = (MyAccount *)obj;
		NSString *image = myAccount.image;
		if (image && image.length > 0) {
			//
		} else {
			image = @"menu_icon_account";
		}
		[cell.textLabel setText:myAccount.name];
		[cell.imageView setImage:[UIImage imageNamed:image]];
	} else if ([obj isKindOfClass:[NSString class]]) {
		cell = [tableView dequeueReusableCellWithIdentifier:kMenuViewControllerCellID2];
		
		// Configure the cell...
		if (cell == nil) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMenuViewControllerCellID2];
			[cell setBackgroundColor:[UIColor clearColor]];
		}
		
		[cell.textLabel setText:[[self.myArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
	}
	
	return cell;
}

#pragma mark UITableViewDelegate protocol
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (self.delegate && [self.delegate respondsToSelector:@selector(handleDidSelectRow:)]) {
		[self.delegate handleDidSelectRow:indexPath];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialViewController
{
    [self.myTableView setBackgroundColor:UIColorFromRGB(0xf6f6f6)];
    //[self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	[self.myTableView reloadData];
}

@end
