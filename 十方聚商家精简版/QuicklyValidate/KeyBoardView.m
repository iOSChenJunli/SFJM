//
//  CalculatorView.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/18.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "KeyBoardView.h"

@implementation KeyBoardView
{
    NSInteger SelectBtnIndex;
}
-(void)awakeFromNib{
    
}

-(void)show{
    NSLog(@"xib测试");
}
- (void)layoutSubviews{
    NSLog(@"加载");
    [super layoutSubviews];
    self.bounds=CGRectMake(0, 0, kScreenWidth, 320);
}
- (void)drawRect:(CGRect)rect {
    NSLog(@"绘图");
}
- (IBAction)calculatorBtnClick:(id)sender {
    SelectBtnIndex=((UIButton *)sender).tag-100;
    _numChar(SelectBtnIndex);
}

- (IBAction)verifyBtn:(id)sender {
    _sureCode();
}

@end
