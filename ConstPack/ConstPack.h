//
//  ConstPack.h
//  ConstPack
//
//  Created by burak soykal on 09/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstPack : NSObject

@property NSString *kullaniciId;

+ (ConstPack*)getInstance;

@end
static ConstPack* singleInstance;
