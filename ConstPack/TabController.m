//
//  TabController.m
//  ConstPack
//
//  Created by burak soykal on 10/03/2017.
//  Copyright © 2017 ConstPack. All rights reserved.
//

#import "TabController.h"
#import "ProfileController.h"
#import "HomeNavigationController.h"
#import "HomeController.h"

@interface TabController () <UITabBarControllerDelegate>


@end

@implementation TabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)doThis{
    
    self.selectedIndex=1;
    
    HomeNavigationController *hnc = (HomeNavigationController*)[self.viewControllers objectAtIndex:1];
    
    
    HomeController *hmctr = [hnc.viewControllers objectAtIndex:0];
    
//    [hmctr testStringControllerLoad:@"Burak"];
    
    
//    ProfileController * p=  (ProfileController *)[self.viewControllers objectAtIndex:1];
    
//    [p.pLabel setText:@"Burak"];
    
}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
   
    
    
    
    return YES;
}

@end
