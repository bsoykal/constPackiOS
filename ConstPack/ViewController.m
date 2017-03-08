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
@synthesize userName,passwd;
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
    LoginResponse* loginresponse1 = [[LoginResponse alloc] init];
    //loginRequest.eposta = @"emrahgenc@outlook.com";
    //loginRequest.password = @"123";
    NSString *pulledUserName = userName.text;
    NSString *pulledPasswd   = passwd.text;
    Boolean loginCheck       = true;
    
    loginRequest.eposta   = pulledUserName;
    loginRequest.password = pulledPasswd;
    
    if (pulledUserName.length == 0 || pulledPasswd.length == 0) {
        loginCheck = false;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hata"
                                                        message:@"Lütfen kullanıcı adı ve sifrenizi kontrol edip tekrar deneyin.."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }else{
        //[self.view.window. dismissViewControllerAnimated:YES completion:nil];
    }
    
    
    if (loginCheck == true) {
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
                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hata"
                                                      message:@"Lütfen kullanıcı adı ve sifrenizi kontrol edip tekrar deneyin."
                                                      delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                             [alert show];
                             [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
                             NSLog(@"Error occured :: loginrequest");
                             
                         }];

    }
    
    

 
}


@end



