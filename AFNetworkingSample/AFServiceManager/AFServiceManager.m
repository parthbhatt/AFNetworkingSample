//
//  AFServiceManager.m
//  AFNetworkingSample
//
//  Created by Parth Rushi Bhatt on 11/5/17.
//  Copyright © 2017 Parth Rushi Bhatt. All rights reserved.
//

#import "AFServiceManager.h"
#import "AFURLRequestSerialization.h"
#import "AFHTTPSessionManager.h"

@implementation AFServiceManager

-(void)callGETService:(NSString *)strURL withParameters:(NSDictionary *)dictParams completion:(AFServiceGETCallback)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLComponents *components = [NSURLComponents componentsWithString:strURL];
    NSMutableArray<NSURLQueryItem *> *params = [NSMutableArray<NSURLQueryItem *> new];
    for(NSString *key in dictParams) {
        [params addObject:[NSURLQueryItem queryItemWithName:key value:[dictParams objectForKey:key]]];
    }
    components.queryItems = params;
    NSURL *url = components.URL;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:[url absoluteString] parameters:dictParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        callback(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        callback(task,nil,error);
    }];
}

-(void)callMultipartRequest:(NSString *)strURL withParams:(NSDictionary *)dictParams withImageData:(NSData *)imgData withImageName:(NSString *)imgName withImageParamaterName:(NSString *)imgParamName withMimeType:(NSString *)mimeTye completion:(AFServiceMultipartCallback)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:strURL parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> multipartFormData) {
        
        for (NSString *key in [dictParams allKeys])
        {
            [multipartFormData appendPartWithFormData:[[dictParams valueForKey:key] dataUsingEncoding:NSUTF8StringEncoding] name:key];
        }
        [multipartFormData appendPartWithFileData:imgData name:imgParamName fileName:imgName mimeType:mimeTye]; //@"image/jpeg"
        
    } progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Response: %@", responseObject);
        callback(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
        callback(task,nil,error);
    }];
}

@end
