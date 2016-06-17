//
//  orderDetailCell.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/20.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "packageOrderDetailCell.h"

@implementation packageOrderDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
//去验证
- (IBAction)GoToVerifyBtnClick:(id)sender {
    _GoToVerify();
}

//查看订单详情
- (IBAction)GoToOrderDetailBtnClick:(id)sender {
    _GoToOrderDetail();
}

@end
