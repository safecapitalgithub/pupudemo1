//
//  NewsListViewController.m
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import "NewsListViewController.h"

@interface NewsListViewControllerTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *descLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;

@end

@implementation NewsListViewControllerTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}

@end


static NSString *kNewsListViewControllerCellID1 = @"NewsListViewControllerCellID1";

@interface NewsListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSArray *myArray;

@end

@implementation NewsListViewController

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
	NewsListViewControllerTableViewCell *cell = nil;
	cell = [tableView dequeueReusableCellWithIdentifier:kNewsListViewControllerCellID1];
	
	// Configure the cell...
	if (cell == nil) {
		NSArray* topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"NewsListViewControllerTableViewCell" owner:self options:nil];
		for (id currentObject in topLevelObjects) {
			if ([currentObject isKindOfClass:[UITableViewCell class]]) {
				cell = (NewsListViewControllerTableViewCell *)currentObject;
				break;
			}
		}
		[cell setBackgroundColor:[UIColor clearColor]];
	}
	
	[cell.descLabel setText:@"AAAAAAA"];
	[cell.timeLabel setText:@"2014-09-01"];

	return cell;
}

#pragma mark UITableViewDelegate protocol
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 114.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
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
	[self setTitle:[Constants MyLocalizedString:@"NEWS_TITLE" defaultIfEmpty:nil]];
	
	
	
	self.myArray = [[NSArray alloc] initWithObjects:
						[[NSArray alloc] initWithObjects:@"1", nil],
						[[NSArray alloc] initWithObjects:@"1", nil],
						[[NSArray alloc] initWithObjects:@"1", nil],
						nil];
	[self.myTableView reloadData];
}

@end
