//
//  Responses.h
//  ConstPack
//
//  Created by Burak Soykal on 24/02/2017.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Domains.h"


@interface  Responses: NSObject
@end

#pragma mark BaseResponse
@interface BaseResponse : JSONModel

@property (nonatomic, assign) BOOL result;
@property (nonatomic, assign) int errorId;
@property (nonatomic, retain) NSString *errorMsg;

@end

#pragma mark LoginResponse

@interface LoginResponse : BaseResponse

@property (nonatomic, retain) User *data;

@end
