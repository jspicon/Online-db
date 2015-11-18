//
//  SpotlightViewController.h
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 16/10/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotlightViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tvElements;
- (IBAction)setupCoreSpotLightSearch:(id)sender;
- (IBAction)addAttributeSet:(id)sender;

@end
