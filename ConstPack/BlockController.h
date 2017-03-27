//
//  BlockController.h
//  ConstPack
//
//  Created by burak soykal on 27/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,retain) BlocksResponse* blocksResponse;


@end
