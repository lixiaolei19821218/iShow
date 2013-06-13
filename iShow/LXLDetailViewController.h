//
//  LXLDetailViewController.h
//  iShow
//
//  Created by 李 潇磊 on 13-6-13.
//  Copyright (c) 2013年 李 潇磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXLShowViewController;
@class LXLSearchViewController;
@class LXLUserManageViewController;

@interface LXLDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) LXLShowViewController *showViewController;
@property (strong, nonatomic) LXLSearchViewController *searchViewController;
@property (strong, nonatomic) LXLUserManageViewController *userManageViewController;

@end