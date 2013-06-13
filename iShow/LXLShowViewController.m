//
//  LXLShowViewController.m
//  iShow
//
//  Created by 李潇磊 on 13-6-13.
//  Copyright (c) 2013年 李 潇磊. All rights reserved.
//

#import "LXLShowViewController.h"

@interface LXLShowViewController ()

@property (strong, nonatomic) UIPopoverController *poc;
@property (strong, nonatomic) UIBarButtonItem *leftButton;

@end

@implementation LXLShowViewController

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
    self.leftButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Master"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(toggleLeftPopover)];
    self.nav.leftBarButtonItem = self.leftButton;
}

- (IBAction)toggleLeftPopover
{    
    if (self.masterPopoverController == nil)
    {
        UINavigationController *navigationController = self.splitViewController.viewControllers[0];
        UIPopoverController *poc = [[UIPopoverController alloc] initWithContentViewController:navigationController];
        [poc presentPopoverFromBarButtonItem:self.leftButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        self.masterPopoverController = poc;
    }
    else {
        if (self.masterPopoverController != nil) {
            [self.masterPopoverController dismissPopoverAnimated:YES];
            self.masterPopoverController = nil;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    [self.nav setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.nav setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
