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

@interface RestManager ()
//private property
@end

static RestManager* singleInstance;

@implementation RestManager

+ (RestManager*)getInstance
{
    static dispatch_once_t dispatchOnceToken;
    
    dispatch_once(&dispatchOnceToken, ^{
        singleInstance = [[RestManager alloc] init];
    });
    
    return singleInstance;
}


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
              
                if([[responseObject objectForKey:@"result"] boolValue]){
                    success(responseObject);
                }else{
                    Error *error = [[Error alloc] init];
                    [error initWithErrorId:[[responseObject objectForKey:@"errorId"] intValue]withMessage:[responseObject objectForKey:@"errorMsg"]];
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
              if([[responseObject objectForKey:@"result"] boolValue]){
                  success(responseObject);
              }else{
                  Error *error = [[Error alloc] init];
                  [error initWithErrorId:[[responseObject objectForKey:@"errorId"] intValue]withMessage:[responseObject objectForKey:@"errorMsg"]];
                  failure(error);
              }          }
          failure:^(NSURLSessionTask *operation, NSError *error){
              NSLog(@"%@", error);
              Error *errorTmp = [[Error alloc] init];
              [errorTmp initWithErrorId:(int) [error code] withMessage: [error localizedDescription]];
              failure(errorTmp);
          }];
}


-(void)doLoginRequest :(LoginRequest*)loginRequest onResponse:(void (^)(LoginResponse* loginResponse))success onError:(void (^)(Error *error)) failure{
    

    [self doPostRequestWithSuffix :@"Login" withParameters:[loginRequest toDictionary] withSuccess:^(id responseObject) {
        NSError* err = nil;
        LoginResponse *loginResponse = [[LoginResponse alloc] initWithDictionary:responseObject error:&err];
        success(loginResponse);
    } withFailure:^(Error *error) {
        failure(error);
    }];
}

-(void)doGetProjectsRequest :(NSString*)userId onResponse:(void (^)(ProjectsResponse* projectsResponse))success onError:(void (^)(Error *error)) failure{
    
    
    [self doGetRequestWithSuffix : [NSString stringWithFormat:@"%@/%@",@"Project",userId]  withSuccess:^(id responseObject) {
        NSError* err = nil;
        ProjectsResponse *projectsResponse = [[ProjectsResponse alloc] initWithDictionary:responseObject error:&err];
        success(projectsResponse);

    } withFailure:^(Error *error) {
        failure(error);
    }];
}


@end
