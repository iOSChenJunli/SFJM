//
//  BigCodeVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/20.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "BigCodeVC.h"
#import "codeImageView.h"
@interface BigCodeVC ()
@property (weak, nonatomic) IBOutlet codeImageView *QCodeImgV;

@end

@implementation BigCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _QCodeImgV.codeString= self.codeString;
    
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
