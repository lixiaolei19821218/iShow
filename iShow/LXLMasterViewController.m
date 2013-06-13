//
//  LXLMasterViewController.m
//  iShow
//
//  Created by 李 潇磊 on 13-6-13.
//  Copyright (c) 2013年 李 潇磊. All rights reserved.
//

#import "LXLMasterViewController.h"
#import "LXLDetailViewController.h"
#import "LXLShowViewController.h"
#import "LXLSearchViewController.h"
#import "LXLUserManageViewController.h"

@interface LXLMasterViewController ()

@end

@implementation LXLMasterViewController

{
    NSArray *viewControllers;
    LXLDetailViewController *detailViewController;
    LXLShowViewController *showViewController;
    LXLUserManageViewController *userManageViewController;
    LXLSearchViewController *searchViewController;
}

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.    
    detailViewController = (LXLDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    showViewController = [[LXLShowViewController alloc] initWithNibName:@"LXLShowViewController" bundle:nil];
    searchViewController = [[LXLSearchViewController alloc] initWithNibName:@"LXLSearchViewController" bundle:nil];
    userManageViewController = [[LXLUserManageViewController alloc] initWithNibName:@"LXLUserManageViewController" bundle:nil];
    
    detailViewController.showViewController = showViewController;
    detailViewController.searchViewController = searchViewController;
    detailViewController.userManageViewController = userManageViewController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:            
            viewControllers = @[self.splitViewController.viewControllers[0], showViewController];
            self.splitViewController.delegate = showViewController;
            self.splitViewController.viewControllers = viewControllers;            
            break;
        case 1:        
            viewControllers = @[self.splitViewController.viewControllers[0], searchViewController];
            self.splitViewController.delegate = searchViewController;
            self.splitViewController.viewControllers = viewControllers;
            break;
        case 2:
            viewControllers = @[self.splitViewController.viewControllers[0], userManageViewController];
            self.splitViewController.delegate = userManageViewController;
            self.splitViewController.viewControllers = viewControllers;
            break;
        default:
            break;
    }
}

@end
