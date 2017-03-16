//
//  ProjectsController.m
//  ConstPack
//
//  Created by burak soykal on 16/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import "ProjectsController.h"
#import "HomeViewCell.h"

@interface ProjectsController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProjectsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 9.0) {
//        _tableView.cellLayoutMarginsFollowReadableWidth = NO;
//    }
}

-(void)viewDidAppear:(BOOL)animated{
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_projectsResponse.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"HomeCell";
    
    HomeViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (homeCell == nil) {
        homeCell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSString *tempPrjName = [[_projectsResponse.data objectAtIndex:indexPath.row ] projeAdi];
    
    [homeCell.home_cell_label setText:tempPrjName];
//    [homeCell.home_cell_image setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
//    
    
    return homeCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    

    
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
