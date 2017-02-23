//
//  Header.h
//  ConstPack
//
//  Created by Burak Soykal on 23/02/2017.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//


#import <JSONModel/JSONModel.h>

@interface Requests: NSObject
@end

#pragma mark Transactions History

@interface LoginRequest : JSONModel

@property (nonatomic, strong) NSString *eposta;
@property (nonatomic, strong) NSString *password;

@end
