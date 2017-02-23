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




-(void)dothat {
    NSLog(@"Baran");
}

-(void)dothis :(LoginRequest*)loginRequest {
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.emrhgnc.com/api/Login"]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    [manager POST:URL.absoluteString parameters:[loginRequest toDictionary] progress:nil success:^(NSURLSessionTask *task, id responseObject) {
       
        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        
    }];

}

//@implementation RestManager

@end
