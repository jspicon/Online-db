//
//  MenuTableViewController.m
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 16/10/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuTableViewController.h"
#import "MenuTableViewCell.h"
#import "HomeViewController.h"
#import "CoreDataViewController.h"

@interface MenuTableViewController ()


@end

@implementation MenuTableViewController
{
    NSArray *aMenuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* fileName = @"menu.plist";
    NSString* menuPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    aMenuItems = [NSArray arrayWithContentsOfFile:menuPath];

}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"goHome"]) {
//        HomeViewController *controller = (HomeViewController *)[[segue destinationViewController] topViewController];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//        return;
//    }
//    if ([[segue identifier] isEqualToString:@"goCore"]) {
//        CoreDataViewController *controller = (CoreDataViewController *)[[segue destinationViewController] topViewController];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//        return;
//    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [aMenuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"menuCell"];
    NSDictionary *dictMenutem = [aMenuItems objectAtIndex:indexPath.row];
    cell.lbTitre.text = [dictMenutem objectForKey:@"title"];
    cell.ivLogo.image = [UIImage imageNamed:[dictMenutem objectForKey:@"image"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dictMenutem = [aMenuItems objectAtIndex:indexPath.row];
    NSString *title = [dictMenutem objectForKey:@"title"];
    NSString *segueName = [NSString stringWithFormat:@"go%@", title ];

    [self performSegueWithIdentifier:segueName sender:self];

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
