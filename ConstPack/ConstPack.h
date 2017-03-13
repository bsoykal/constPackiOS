//
//  ConstPack.h
//  ConstPack
//
//  Created by burak soykal on 09/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstPack : NSObject

@property(nonatomic,retain) NSString *kullaniciId;

+ (ConstPack*)getInstance;

@end



