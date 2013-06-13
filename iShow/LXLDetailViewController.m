//
//  LXLDetailViewController.m
//  iShow
//
//  Created by 李 潇磊 on 13-6-13.
//  Copyright (c) 2013年 李 潇磊. All rights reserved.
//

#import "LXLDetailViewController.h"
#import "LXLShowViewController.h"
#import "LXLSearchViewController.h"
#import "LXLUserManageViewController.h"

@interface LXLDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation LXLDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{    
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    [self.showViewController.nav setLeftBarButtonItem:barButtonItem animated:YES];
    [self.searchViewController.nav setLeftBarButtonItem:barButtonItem animated:YES];
    [self.userManageViewController.nav setLeftBarButtonItem:barButtonItem animated:YES];
    
    self.masterPopoverController = popoverController;
    self.showViewController.masterPopoverController = popoverController;
    self.searchViewController.masterPopoverController = popoverController;
    self.userManageViewController.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
