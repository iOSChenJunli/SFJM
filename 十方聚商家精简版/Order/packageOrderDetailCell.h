//
//  orderDetailCell.h
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/20.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface packageOrderDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *varLabTit1;
@property (weak, nonatomic) IBOutlet UILabel *varLabTit2;
@property (weak, nonatomic) IBOutlet UILabel *varLabTit3;
@property (weak, nonatomic) IBOutlet UILabel *varLabTit4;

@property (nonatomic ,strong) void(^GoToVerify)(void);
@property (nonatomic ,strong) void(^GoToOrderDetail)(void);
@end
