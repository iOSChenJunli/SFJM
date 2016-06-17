//
//  LoginVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/14.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView *leftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
//    leftView.image=[ui]
//    _accountTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone"]];
//    _accountTF.leftViewMode = UITextFieldViewModeAlways;
//    _passwordTF.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone1"]];
//    _passwordTF.leftViewMode = UITextFieldViewModeAlways;
}

- (IBAction)backClick:(id)sender {
    NSLog(@"sdafaf");
//    [(UITabBarController*)[[[[UIApplication sharedApplication]delegate]window] rootViewController]   setSelectedIndex:0];
    UITabBarController *TabBC=(UITabBarController*)[[[[UIApplication sharedApplication]delegate]window] rootViewController];
    if (TabBC.selectedIndex==4) {
        [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"BarHiddenAnimate"];
    }
    TabBC.selectedIndex=2;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
