//
//  LXLShowViewController.h
//  iShow
//
//  Created by 李潇磊 on 13-6-13.
//  Copyright (c) 2013年 李 潇磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXLShowViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UINavigationItem *nav;
@property(strong, nonatomic) UIPopoverController *masterPopoverController;

- (IBAction)toggleLeftPopover;

@end
