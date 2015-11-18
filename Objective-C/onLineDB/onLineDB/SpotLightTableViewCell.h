//
//  SpotLightTableViewCell.h
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 16/11/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotLightTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDescritpion;
@property (weak, nonatomic) IBOutlet UILabel *lbKeywords;
@property (weak, nonatomic) IBOutlet UIImageView *ivImage;

@end
