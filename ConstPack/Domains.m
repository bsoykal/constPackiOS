//
//  Domains.m
//  ConstPack
//
//  Created by Burak Soykal on 24/02/2017.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Domains.h"

@implementation Domains
@end

@implementation User
@end

@implementation Error
- (void) initWithErrorId:(int) errorId withMessage:(NSString *)errorMsg{
    self.errorId = errorId;
    self.errorMsg = errorMsg;
}

@end
