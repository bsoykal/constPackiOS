//
//  UIViewController+TestController.m
//  ConstPack
//
//  Created by Burak Soykal on 08/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import "HomeController.h"
#import "HomeViewCell.h"

@interface HomeController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation HomeController{
    
    NSArray *labelArray;
    NSArray *imageArray;

   
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    labelArray = [NSArray arrayWithObjects:@"PROJELER", @"HABERLER", nil];
    imageArray = [NSArray arrayWithObjects:@"ic_project.png",@"ic_news.png", nil];
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 9.0) {
        _tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [labelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"HomeCell";
    
    HomeViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (homeCell == nil) {
        homeCell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    [homeCell.home_cell_label setText: [labelArray objectAtIndex:indexPath.row]];
    [homeCell.home_cell_image setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
   
    
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//-(void)testStringControllerLoad:(NSString *)str{
//    
////    test=str;
//    
//}

-(void)viewDidAppear:(BOOL)animated{
//    [self.homeLabel setText:test];
    
//    [self.navigationController pushViewController:nil animated:YES];
    
    
}




@end
