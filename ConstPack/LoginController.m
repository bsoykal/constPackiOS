#import "RestManager.h"
#import "LoginController.h"
#import "ConstPack.h"

@interface LoginController ()

@end

@implementation LoginController
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
    //loginRequest.eposta = @"emrahgenc@outlook.com";
    //loginRequest.password = @"123";
//    NSString *pulledUserName = ;

//
    userName.text = @"emrahgenc@outlook.com";
    passwd.text = @"123";
    
    
    loginRequest.eposta   = userName.text;
    loginRequest.password = passwd.text;
    
    if ([userName.text isEqualToString: @""]||[passwd.text isEqualToString: @""]) {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Hata"
                                     message:@"Lütfen kullanıcı adı ve sifrenizi doldurup, tekrar deneyin.."
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Tamam"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        
                                    }];
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }

    [restManager doLoginRequest:loginRequest
                     onResponse: ^(LoginResponse *loginresponse) {
                         [ConstPack getInstance].kullaniciId = [NSString stringWithFormat:@"%d",loginresponse.data.kullaniciId];

                         [restManager doGetProjectsRequest : [NSString stringWithFormat:@"%d",loginresponse.data.kullaniciId]
                                                 onResponse: ^(ProjectsResponse* projectsResponse){
                                                     NSLog(@"Success :: project size %lu",(unsigned long)[projectsResponse.data count]);
                                                     
                                                     
                                                     NSString * storyboardName = @"Main";
                                                     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
                                                     UITabBarController * vc = [storyboard instantiateViewControllerWithIdentifier:@"TabController"];
                                                     
                                                     vc.selectedIndex = 1;
                                                     
                                                     
                                                     [self presentViewController:vc animated:YES completion:nil];
                                                     
                                                     
                                                     
                                                     
                                                
                                                 }
                                                    onError: ^(Error *error){
                                                        NSLog(@"Error occured :: projects request");
                                                    }];
                         
                     }onError: ^(Error *error){
                         UIAlertController * alert = [UIAlertController
                                                      alertControllerWithTitle:@"Hata"
                                                      message:@"Lütfen kullanıcı adı ve sifrenizi kontrol edip tekrar deneyin.."
                                                      preferredStyle:UIAlertControllerStyleAlert];
                         
                
                         
                         UIAlertAction* yesButton = [UIAlertAction
                                                     actionWithTitle:@"Tamam"
                                                     style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                     //CALL SMTH HERE !!
                                                     }];
                         [alert addAction:yesButton];
                         [self presentViewController:alert animated:YES completion:nil];
                         NSLog(@"Error occured :: loginrequest");
                         
                     }];

    

 
}


@end



