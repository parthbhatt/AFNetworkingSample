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

/**
 * @description Call GET web service request using this method.
 * @param strURL The String URL for the request
 * @param dictParams The dictionary of the parameters which are to be passed in request
 * @param callback This callback is a completion handler block which contains task, responseObject and error object.
 */
-(void)callGETService:(NSString *)strURL withParameters:(NSDictionary *)dictParams completion:(AFServiceGETCallback)callback;

/**
 * @description Call Multipart web service request using this method.
 * @param strURL The String URL for the request
 * @param dictParams The dictionary of the parameters which are to be passed in request
 * @param imgData The NSData object of Image/File
 * @param imgName The image name or file name
 * @param imgParamName The image parameter name is the webservice parameter name.
 * @param mimeType The mimetype of attached image. Example: image\jpeg, image\png, etc
 * @param callback This callback is a completion handler block which contains task, responseObject and error object.
 */
-(void)callMultipartRequest:(NSString *)strURL withParams:(NSDictionary *)dictParams withImageData:(NSData *)imgData withImageName:(NSString *)imgName withImageParamaterName:(NSString *)imgParamName withMimeType:(NSString *)mimeType completion:(AFServiceMultipartCallback)callback;

@end
