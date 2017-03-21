//
//  ProjectsController.h
//  ConstPack
//
//  Created by burak soykal on 16/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectsController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,retain) ProjectsResponse* projectsResponse;



@end
