//
//  CalculatorView.h
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/18.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoardView : UIView
@property (nonatomic ,strong) void(^numChar)(NSInteger num);
@property (nonatomic ,strong) void(^sureCode)(void);
@end
