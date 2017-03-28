//
//  FloorController.h
//  ConstPack
//
//  Created by burak soykal on 28/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FloorController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,retain) FloorResponse* floorResponse;

@end
