//
//  ChangePasswordVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/14.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "ChangePasswordVC.h"

@interface ChangePasswordVC ()
{
    BOOL flg;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *msgHeight;

@end

@implementation ChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.phone);
    flg=NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         _msgHeight.constant = 0;
    });
   
}
- (IBAction)sureBtnClick:(id)sender {
    if (flg) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
               _msgHeight.constant = 0; 
            }];
            
        });
        flg=NO;
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                _msgHeight.constant = 25;
            }];
            
        });
        flg=YES;
    }
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
