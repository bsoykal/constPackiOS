//
//  RestManager.m
//  ConstPack
//
//  Created by Bartu Kusculuoglu on 07/02/17.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "RestManager.h"

@implementation RestManager






-(void)doPostRequestWithSuffix:(NSString*) suffix withParameters:(NSDictionary*) paramters withSuccess:(void (^)(NSURLSessionTask *task, id responseObject))success withFailure:(void (^)(NSURLSessionTask *operation, NSError *error))failure{
    NSURL *URL = [NSURL URLWithString: [NSString stringWithFormat:@"%@/%@", BASE_URL, suffix]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    [manager POST:URL.absoluteString parameters: paramters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        failure(operation,error);
    }];
}



-(void)doLoginRequest :(LoginRequest*)loginRequest onResponse:(void (^)(LoginResponse* loginResponse))success onError:(void (^)(NSError *error)) failure{
    [self doPostRequestWithSuffix :@"Login" withParameters:[loginRequest toDictionary] withSuccess:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        success(responseObject);

    } withFailure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@", error);
        failure(error);
    }];
}

     


//@implementation RestManager

@end
