//
//  MenuViewController.h
//  pupudemo1
//
//  Created by Paul Yip on 29/7/14.
//  Copyright (c) 2014 safecapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol MenuViewControllerDelegate <NSObject>

- (void)handleDidSelectRow:(NSIndexPath *)indexPath;

@end

@interface MenuViewController : BaseViewController

@property (nonatomic, assign) id<MenuViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *myArray;

@end
