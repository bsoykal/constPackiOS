//
//  BlockController.m
//  ConstPack
//
//  Created by burak soykal on 27/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import "BlockController.h"
#import "HomeViewCell.h"

@interface BlockController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self initNavBar];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_blocksResponse.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    HomeViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:HOME_CELL];
    
    if (homeCell == nil) {
        homeCell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HOME_CELL];
    }
    NSString *tempPrjName = [[_blocksResponse.data objectAtIndex:indexPath.row ] blokAdi];
    
    [homeCell.home_cell_label setText:tempPrjName];
    [homeCell.home_cell_image setImage:[UIImage imageNamed:@"ic_building.png"]];
    
    
    return homeCell;
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void) initNavBar{
    UIImage* logoImage = [UIImage imageNamed:@"constpack_logo_white"];
    UIImageView *logoImageView=[[UIImageView alloc] initWithImage:logoImage];
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.navigationItem.titleView = logoImageView;
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    self.navigationController.navigationBar.translucent = NO;
    
    
    [self.navigationItem.titleView setFrame:CGRectMake(self.navigationItem.titleView.frame.origin.x, self.navigationItem.titleView.frame.origin.y,self.navigationItem.titleView.frame.size.width, self.navigationItem.titleView.frame.size.height-5)];
}



@end
