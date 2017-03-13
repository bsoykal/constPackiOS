//
//  ConstPack.m
//  ConstPack
//
//  Created by burak soykal on 09/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import "ConstPack.h"

@interface ConstPack ()
//private property
@end

static ConstPack* singleInstance;

@implementation ConstPack

+ (ConstPack*)getInstance
{
    static dispatch_once_t dispatchOnceToken;
    
    dispatch_once(&dispatchOnceToken, ^{
        singleInstance = [[ConstPack alloc] init];
    });
    
    return singleInstance;
}


@end
