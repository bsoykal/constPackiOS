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

@protocol Project @end
@protocol Block @end
@protocol Floor @end
@protocol Product @end

#pragma mark BaseResponse
@interface BaseResponse : JSONModel
@property (nonatomic, assign) BOOL result;
@property (nonatomic, assign) int errorId;
@property (nonatomic, retain)  NSString <Optional> *errorMsg;
@end

#pragma mark LoginResponse
@interface LoginResponse : BaseResponse
@property (nonatomic, retain)  User * data;
@end

#pragma mark ProjectsResponse
@interface ProjectsResponse : BaseResponse
@property(nonatomic, strong)  NSMutableArray<Project> * data;
@end

#pragma mark BlocksResponse
@interface BlocksResponse : BaseResponse
@property(nonatomic, strong)  NSMutableArray<Block> *data;
@end

#pragma mark FloorResponse
@interface FloorResponse: BaseResponse
@property(nonatomic, strong)  NSMutableArray<Floor> *data;
@end

#pragma mark ProductResponse
@interface ProductResponse: BaseResponse
@property(nonatomic, strong)  NSMutableArray<Product> *data;
@end
