#import "LoginController.h"
#import "TabController.h"


@interface LoginController ()

@end

@implementation LoginController
@synthesize userName,passwd;

- (void)viewDidLoad {
    [super viewDidLoad];
    userName.text = @"emrahgenc@outlook.com";
    passwd.text = @"123";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    LoginRequest* loginRequest = [[LoginRequest alloc] init];
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

    [[RestManager getInstance] doLoginRequest:loginRequest
                     onResponse: ^(LoginResponse *loginresponse) {
                         [[ConstPack getInstance] setKullaniciId:[NSString stringWithFormat:@"%d",loginresponse.data.kullaniciId]];
                         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:MAIN_STORYBRD bundle: nil];
                         TabController *vc = (TabController *)([storyboard instantiateViewControllerWithIdentifier:@"TabController"]);
                         [vc doThis];
                         
                         [self presentViewController:vc animated:YES completion:nil];

                         
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



