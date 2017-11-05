//
//  ViewController.m
//  AFNetworkingSample
//
//  Created by Parth Rushi Bhatt on 11/5/17.
//  Copyright © 2017 Parth Rushi Bhatt. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
#import "AFServiceManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GET Request
    NSDictionary *paramsDict = @{@"consultation_id": @"8400"};
    AFServiceManager *serviceManager = [[AFServiceManager alloc] init];
    [serviceManager callGETService:@"https://s1.coranetsolutions.com:8443/coranetWeb/consultation-details" withParameters:paramsDict completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if(responseObject != nil && error == nil)
        {
            NSLog(@"ResonseObject: %@",responseObject);
        }
        else
        {
            NSLog(@"Error: %@",error.description);
        }
    }];
    
    //Multipart request
    NSData *imageData = nil;
    NSDictionary *parameters = @{@"consultation_id": @"8400", @"file_name": @"8400_imagetest"}; //@"file_content": base64String
    [serviceManager callMultipartRequest:@"" withParams:parameters withImageData:imageData withImageName:@"8400_imagetest" withImageParamaterName:@"file_content" withMimeType:@"image/jpeg" completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if(responseObject != nil && error == nil)
        {
            NSLog(@"ResonseObject: %@",responseObject);
        }
        else
        {
            NSLog(@"Error: %@",error.description);
        }
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
