//
//  Header.h
//  ConstPack
//
//  Created by Burak Soykal on 23/02/2017.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//


#import <JSONModel/JSONModel.h>
#import "Domains.h"

@interface Requests: NSObject
@end

#pragma mark LoginRequest
@interface LoginRequest : JSONModel
@property (nonatomic, retain) NSString *eposta;
@property (nonatomic, retain) NSString *password;
@end
