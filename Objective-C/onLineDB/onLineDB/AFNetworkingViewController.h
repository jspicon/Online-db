//
//  AFNetworkingViewController.h
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 09/11/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface AFNetworkingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfChallenge;
@property (weak, nonatomic) IBOutlet UITextView *tvResponse;
- (IBAction)sendChallenge:(id)sender;
- (IBAction)sendChallenge2:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *scProtocol;

@end
