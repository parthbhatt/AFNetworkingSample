//
//  AFServiceManager.h
//  AFNetworkingSample
//
//  Created by Parth Rushi Bhatt on 11/5/17.
//  Copyright © 2017 Parth Rushi Bhatt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AFServiceGETCallback)(NSURLSessionDataTask *task, id responseObject, NSError *error);
typedef void(^AFServiceMultipartCallback)(NSURLSessionDataTask *task, id responseObject, NSError *error);

@interface AFServiceManager : NSObject

-(void)callGETService:(NSString *)strURL withParameters:(NSDictionary *)dictParams completion:(AFServiceGETCallback)callback;
-(void)callMultipartRequest:(NSString *)strURL withParams:(NSDictionary *)dictParams withImageData:(NSData *)imgData withImageName:(NSString *)imgName withImageParamaterName:(NSString *)imgParamName withMimeType:(NSString *)mimeTye completion:(AFServiceMultipartCallback)callback;

@end
