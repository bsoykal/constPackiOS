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

-(void)doLoginRequest :(LoginRequest*)loginRequest onResponse:(void (^)(LoginResponse* loginResponse))response onError:(void (^)(NSError *error)) error;

@end


