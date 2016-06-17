//
//  OrderDetailTabVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/20.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "OrderDetailVC.h"

@interface OrderDetailVC ()
@property (weak, nonatomic) IBOutlet UITableView *myTabView;
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *downLimt;

@end

@implementation OrderDetailVC
//打电话给客户
- (IBAction)callToCustom:(id)sender {
    NSLog(@"打电话给客户");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTabView.tableFooterView = [[UIView alloc]init];
    switch (_orderType) {
        case 0:
        {
            NSLog(@"套餐");
        }
            break;
        case 1:
        {
            NSLog(@"订餐");
        }
            break;
        default:
        {
            NSLog(@"折扣");
        }
            break;
    }
    switch (_payType) {
        case 0:
        {
            NSLog(@"未支付");
            _phoneView.hidden=YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5 animations:^{
                    _downLimt.constant = 0;
                }];
                
            });

        }
            break;
        case 1:
        {
            _phoneLab.text = @"1234567890";
            NSLog(@"已支付");
            _phoneView.hidden =NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5 animations:^{
                    _downLimt.constant = 40;
                }];
                
            });
        }
            break;
        default:
        {
            _phoneLab.text = @"1234567890";
            NSLog(@"交易完成");
            _phoneView.hidden =NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5 animations:^{
                    _downLimt.constant = 40;
                }];
                
            });
        }
            break;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    switch (_orderType) {
        case 0:
        {
            NSLog(@"套餐");
            return 1;
        }
            break;
        case 1:
        {
            NSLog(@"订餐");
            return 3;
        }
            break;
        default:
        {
            NSLog(@"折扣");
            return 1;
        }
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (_orderType) {
        case 0:
        {
            NSLog(@"套餐");
            if (_payType!=0) {
                return 3;
            }else{
                return 2;
            }
            
        }
            break;
        case 1:
        {
            NSLog(@"订餐");
            if (section==0) {
                return 1;
            }else if (section==1){
                return 9;
            }else{
                return 3;
            }
        }
            break;
        default:
        {
            NSLog(@"折扣");
            return 2;
        }
            break;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (_orderType) {
        case 0:
        {
            NSLog(@"套餐");
            if (_payType!=0) {
                if (indexPath.row==0) {
                    return 140;
                }else if (indexPath.row==1){
                    return 84;
                }else{
                    return 63;
                }
            }else{
                if (indexPath.row==0) {
                    return 140;
                }else{
                    return 40;
                }
            }
            
        }
            break;
        case 1:
        {
            NSLog(@"订餐");
            if (indexPath.section==0) {
                return 90;
            }else if (indexPath.section==1){
                return 40;
            }else{
                if (indexPath.row==0) {
                    return 140;
                }else if (indexPath.row==1){
                     if (_payType!=0) {
                         return 84;
                     }else{
                         return 40;
                     }
                }else{
                    return 60;
                }
            }

        }
            break;
        default:
        {
            NSLog(@"折扣");
            if (indexPath.row==0) {
                return 140;
            }else {
                if (_payType!=0) {
                    return 84;
                }else{
                    return 40;
                }
            }
        }
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (_orderType) {
        case 0:
        {
            NSLog(@"套餐");
            if (_payType!=0) {
                if (indexPath.row==0) {
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"orderSummaryCell"];
                    return cell;
                }else if (indexPath.row==1){
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"havePayCell"];
                    return cell;
                }else{
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"goodsVolumeCell"];
                    return cell;
                }
            }else{
                if (indexPath.row==0) {
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"orderSummaryCell"];
                    return cell;
                }else{
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"notPayCell"];
                    return cell;
                }
            }
            
        }
            break;
        case 1:
        {
            NSLog(@"订餐");
            if (indexPath.section==0) {
                UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"orderHeadCell"];
                return cell;
            }else if (indexPath.section==1){
                UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"menuCell"];
                return cell;
            }else{
                if (indexPath.row==0) {
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"orderSummaryCell"];
                    return cell;
                }else if (indexPath.row==1){
                    if (_payType!=0) {
                        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"havePayCell"];
                        return cell;
                    }else{
                        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"havePayCell"];
                        return cell;
                    }
                }else{
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"noteCell"];
                    return cell;
                }
            }

            
           

        }
            break;
        default:
        {
            NSLog(@"折扣");
            if (indexPath.row==0) {
                UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"orderSummaryCell"];
                return cell;
            }else {
                if (_payType!=0) {
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"havePayCell"];
                    return cell;
                }else{
                    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"notPayCell"];
                    return cell;
                }
            }

            

        }
            break;
    }

}

@end
