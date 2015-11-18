//
//  AFNetworkingViewController.m
//  onLineDB
//
//  Created by Jean-Sébastien PICON on 09/11/2015.
//  Copyright © 2015 Jean-Sébastien PICON. All rights reserved.
//

#import "AFNetworkingViewController.h"

static NSString * const BaseURLString = @"http://rest:8888/";

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)sendChallenge:(id)sender {
    NSString *challenge = self.tfChallenge.text;
    
    NSString *string = [NSString stringWithFormat:@"%@challenge?challenge=%@", BaseURLString, challenge];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSLog(@"response : %@", (NSDictionary *)responseObject);
//        self.weather = (NSDictionary *)responseObject;
//        self.title = @"JSON Retrieved";
//        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error : %@", [error localizedDescription]);
    }];

    [operation start];
}

- (IBAction)sendChallenge2:(id)sender {

    NSURL *baseURL = [NSURL URLWithString:BaseURLString];
    NSString *challenge = self.tfChallenge.text;
    NSDictionary *parameters = @{@"challenge": challenge};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if (self.scProtocol.selectedSegmentIndex == 0) {
        [manager GET:@"challenge" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"GET : %@", (NSDictionary *)responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"error : %@", [error localizedDescription]);
         }];
    } else if (self.scProtocol.selectedSegmentIndex == 1) {
        [manager POST:@"challenge" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"POST : %@", (NSDictionary *)responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"error : %@", [error localizedDescription]);
        }];
    }

}



@end
