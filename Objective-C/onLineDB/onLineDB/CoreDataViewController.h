//
//  MasterViewController.h
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 16/10/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "CoreDataDetailViewController.h"
#import "Event.h"

@class DetailViewController;

@interface CoreDataViewController : UITableViewController < NSFetchedResultsControllerDelegate, UIPopoverPresentationControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

