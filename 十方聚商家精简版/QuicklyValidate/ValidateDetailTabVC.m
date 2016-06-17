//
//  ValidateDetailTabVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/17.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "ValidateDetailTabVC.h"
#import "KeyBoardView.h"
@interface ValidateDetailTabVC ()<UITextFieldDelegate>
{
    KeyBoardView *keyBoardView;
}
@property (weak, nonatomic) IBOutlet UITextField *SerialNumberTF;//商品劵编号
@property (weak, nonatomic) IBOutlet UITextField *SerialPassWordTF;//商品劵密码
@property (weak, nonatomic) IBOutlet UIView *SerialNumberView;//有商品卷编号



@end

@implementation ValidateDetailTabVC
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_isHaveSerialNumber) {
        _SerialNumberTF.hidden=YES;
        _SerialNumberView.hidden=NO;
        [_SerialPassWordTF becomeFirstResponder];
    }else{
        _SerialNumberTF.hidden=NO;
        _SerialNumberView.hidden=YES;
        [_SerialNumberTF becomeFirstResponder];
        
    }
    
    NSLog(@"cell%ld",(long)self.index);
    self.tableView.tableFooterView =[[UIView alloc]init];
    
    _SerialNumberTF.delegate=self;
    _SerialPassWordTF.delegate=self;
//    _SerialPassWordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
//    _SerialNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
//    keyBoardView=[[[NSBundle mainBundle]loadNibNamed:@"KeyBoardView" owner:self options:nil]lastObject];
//    _SerialNumberTF.inputView =keyBoardView;
//    _SerialPassWordTF.inputView =keyBoardView;
//    [self KeyBoardBtnClick];
//    [self sureBtnClick];
}
//-(void)KeyBoardBtnClick{
//     __weak typeof(self) weakSelf =self;
//    [keyBoardView setNumChar:^(NSInteger num) {
//        NSLog(@"%ld",(long)num);
//        if(weakSelf.SerialNumberTF.isFirstResponder){
//            NSLog(@"SerialNumberTF");
//            weakSelf.SerialNumberTF.text=[NSString stringWithFormat:@"%@%ld",weakSelf.SerialNumberTF.text,(long)num];
//        }else{
//            NSLog(@"SerialPassWordTF");
//            weakSelf.SerialPassWordTF.text=[NSString stringWithFormat:@"%@%ld",weakSelf.SerialPassWordTF.text,(long)num];
//        }
//    }];
//}
//-(void)sureBtnClick{
//    __weak typeof(self) weakSelf =self;
//    [keyBoardView setSureCode:^{
//        //执行验证操作
//        [weakSelf.SerialNumberTF resignFirstResponder];
//        [weakSelf.SerialPassWordTF resignFirstResponder];
//    }];
//}
//- (void)textFieldDidBeginEditing:(UITextField *)textField;{
//    if (textField==_SerialPassWordTF&&kScreenHeight==480) {
//        // __IPHONE_4
//        self.tableView.contentOffset=CGPointMake(0, 50);
//    }
//    
//    if (textField==_SerialNumberTF&&kScreenHeight==480) {
//        // __IPHONE_4
//        self.tableView.contentOffset=CGPointMake(0, 0);
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
