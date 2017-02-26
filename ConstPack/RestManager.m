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


-(void)doPostRequestWithSuffix:(NSString*) suffix withParameters:(NSDictionary*) paramters withSuccess:(void (^)(id responseObject))success withFailure:(void (^)(Error *error))failure{
    NSURL *URL = [NSURL URLWithString: [NSString stringWithFormat:@"%@/%@", BASE_URL, suffix]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    [manager POST:URL.absoluteString
          parameters: paramters
          progress:nil
          success:^(NSURLSessionTask *task, id responseObject){
                NSLog(@"%@", responseObject);
                if(((BaseResponse *)responseObject).result == true){
                    success(responseObject);
                }else{
                    Error *error = [[Error alloc] init];
                    [error initWithErrorId:((BaseResponse *)responseObject).errorId withMessage:((BaseResponse *)responseObject).errorMsg];
                    failure(error);
                }
          }
          failure:^(NSURLSessionTask *operation, NSError *error){
                NSLog(@"%@", error);
                Error *errorTmp = [[Error alloc] init];
                [errorTmp initWithErrorId:(int) [error code] withMessage: [error localizedDescription]];
                failure(errorTmp);
          }];
}

-(void)doGetRequestWithSuffix:(NSString*)suffix withSuccess:(void (^)(id responseObject))success withFailure:(void (^)(Error *error))failure{
    NSURL *URL = [NSURL URLWithString: [NSString stringWithFormat:@"%@/%@", BASE_URL, suffix]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   // manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    [manager GET:URL.absoluteString
       parameters: nil
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject){
              NSLog(@"%@", responseObject);
              if(((BaseResponse *)responseObject).result == true){
                  success(responseObject);
              }else{
                  Error *error = [[Error alloc] init];
                  [error initWithErrorId:((BaseResponse *)responseObject).errorId withMessage:((BaseResponse *)responseObject).errorMsg];
                  failure(error);
              }
          }
          failure:^(NSURLSessionTask *operation, NSError *error){
              NSLog(@"%@", error);
              Error *errorTmp = [[Error alloc] init];
              [errorTmp initWithErrorId:(int) [error code] withMessage: [error localizedDescription]];
              failure(errorTmp);
          }];
}


-(void)doLoginRequest :(LoginRequest*)loginRequest onResponse:(void (^)(LoginResponse* loginResponse))success onError:(void (^)(Error *error)) failure{
    

    [self doPostRequestWithSuffix :@"Login" withParameters:[loginRequest toDictionary] withSuccess:^(id responseObject) {
        success(responseObject);
    } withFailure:^(Error *error) {
        failure(error);
    }];
}

-(void)doGetProjectsRequest :(NSString*)userId onResponse:(void (^)(LoginResponse* loginResponse))success onError:(void (^)(Error *error)) failure{
    
    
    [self doGetRequestWithSuffix : [NSString stringWithFormat:@"%@/%@",@"Project",userId]  withSuccess:^(id responseObject) {
        success(responseObject);
    } withFailure:^(Error *error) {
        failure(error);
    }];
}


@end
