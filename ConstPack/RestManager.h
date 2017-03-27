//
//  RestManager.h
//  ConstPack
//
//  Created by Bartu Kusculuoglu on 07/02/17.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Requests.h"
#import "Responses.h"

static NSString *const BASE_URL = @"http://www.emrhgnc.com/api/";

@interface RestManager : NSObject

+ (RestManager*)getInstance;

-(void)doLoginRequest :(LoginRequest*)loginRequest onResponse:(void (^)(LoginResponse* loginResponse))response onError:(void (^)(Error *error)) error;


-(void)doGetProjectsRequest :(NSString*)userId onResponse:(void (^)(ProjectsResponse* projectsResponse))success onError:(void (^)(Error *error)) failure;

-(void)doGetBlocksRequest :(int)projectId onResponse:(void (^)(BlocksResponse* blockResponse))success onError:(void (^)(Error *error)) failure;

@end


