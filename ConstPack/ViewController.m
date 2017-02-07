//
//  ViewController.m
//  ConstPack
//
//  Created by Bartu Kusculuoglu on 07/02/17.
//  Copyright © 2017 Bartu Kusculuoglu. All rights reserved.
//

#import "ViewController.h"
#import "RestManager.h"

@interface ViewController ()

@end

@implementation ViewController

RestManager *restMan;
 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    restMan = [[RestManager alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    [restMan blassss];
}

@end
