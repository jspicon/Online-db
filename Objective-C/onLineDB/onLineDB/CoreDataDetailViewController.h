//
//  DetailViewController.h
//  test
//
//  Created by Jean-Sébastien PICON on 04/11/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

