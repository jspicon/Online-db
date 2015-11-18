//
//  SpotlightViewController.m
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 16/10/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import "SpotlightViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "SpotLightTableViewCell.h"

@interface SpotlightViewController ()

@end

@implementation SpotlightViewController
{
    NSMutableArray *aElements;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    aElements = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)setupCoreSpotLightSearch:(id)sender {

    
    NSMutableArray *aItem = [[NSMutableArray alloc] init];
    for (CSSearchableItemAttributeSet *attributeSet in aElements) {
        CSSearchableItem *item = [[CSSearchableItem alloc]
                                  initWithUniqueIdentifier:NULL
                                  domainIdentifier:@"com.acsimodulo"
                                  attributeSet:attributeSet];
        [aItem addObject:item];
    }
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:aItem
                                                   completionHandler: ^(NSError * __nullable error) {
                                                       if (!error)
                                                           NSLog(@"Search item indexed");
                                                   }];
}

- (IBAction)addAttributeSet:(id)sender {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Ajouter"
                                  message:@"Tous les champs sont obligatoires"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Title";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Description";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"keyword1, keyword2, keyword3";
    }];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Add"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    NSString *title = alert.textFields[0].text;
                                    NSString *contentDescription = alert.textFields[1].text;
                                    NSString *keyword = alert.textFields[2].text;

                                    NSArray *aKeywords = [keyword componentsSeparatedByString:@","];
                                    NSMutableArray *aTrimmedKeywords = [[NSMutableArray alloc] init];
                                    for (NSString * key in aKeywords) {
                                        NSString *trimKeyword = [key stringByTrimmingCharactersInSet:
                                                         [NSCharacterSet whitespaceCharacterSet]];
                                        [aTrimmedKeywords addObject:trimKeyword];
                                    }
                                    CSSearchableItemAttributeSet *attributeSet;
                                    attributeSet = [[CSSearchableItemAttributeSet alloc]
                                                    initWithItemContentType:(NSString *)kUTTypeImage];
                                    
                                    attributeSet = [[CSSearchableItemAttributeSet alloc]
                                                    initWithItemContentType:(NSString *)kUTTypeImage];
                                    attributeSet.title = title;
                                    attributeSet.contentDescription = contentDescription;
                                    attributeSet.keywords = aTrimmedKeywords;
                                    UIImage *image = [UIImage imageNamed:@"Search"];
                                    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
                                    attributeSet.thumbnailData = imageData;
                                    [aElements addObject:attributeSet];
                                    [self.tvElements reloadData];
                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                    
                                }];
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   [alert dismissViewControllerAnimated:YES completion:nil];
                                   
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark TableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [aElements count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SpotLightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"spotLightCell" forIndexPath:indexPath];
    CSSearchableItemAttributeSet *attribute = [aElements objectAtIndex:indexPath.row];
    cell.lbTitle.text = attribute.title;
    cell.lbDescritpion.text = attribute.contentDescription;
    NSString *szKeywords = @"";
    for (NSString *keyword in attribute.keywords) {
        szKeywords = [szKeywords stringByAppendingString:keyword];
        szKeywords = [szKeywords stringByAppendingString:@", "];
    }
    if ([szKeywords length]>2)
        szKeywords = [szKeywords substringToIndex:[szKeywords length]-2];
    cell.lbKeywords.text = szKeywords;
    cell.ivImage.image = [UIImage imageNamed:@"Search"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    return 60;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"SectionHeader";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    return headerView;
}

#pragma mark TableViewDelegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [aElements removeObjectAtIndex:indexPath.row];
        [self.tvElements reloadData];
    }
}
@end
