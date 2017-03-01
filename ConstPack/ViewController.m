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
//@synthesize userName,passwd;
RestManager *restManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    restManager = [[RestManager alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    LoginRequest* loginRequest = [[LoginRequest alloc] init];
    loginRequest.eposta = @"emrahgenc@outlook.com";
    loginRequest.password = @"123";

    
    [restManager doLoginRequest:loginRequest
     
                     onResponse: ^(LoginResponse *loginresponse) {
                         
                         [restManager doGetProjectsRequest : [NSString stringWithFormat:@"%d",loginresponse.data.kullaniciId]
                                                 onResponse: ^(ProjectsResponse* projectsResponse){
                                                     NSLog(@"Success :: project size %lu",(unsigned long)[projectsResponse.data count]);
                                                 }
                                                onError: ^(Error *error){
                                                        NSLog(@"Error occured :: projects request");
                                                    }];

                         
                         
                         
                     }onError: ^(Error *error){
                         
                         NSLog(@"Error occured :: loginrequest");

                     }];
    
    /*NSString * pulledUserName = userName.text;
    NSString * pulledPasswd   = passwd.text;
    if (sizeof(pulledUserName) == 0 || sizeof(pulledPasswd) == 0) {
        //UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Hata"
           //                                           message:@"Lütfen alanları boş bırakmayın"
          //                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[av show];
        NSLog(@"%@", pulledUserName);
    }
 */
}


@end



