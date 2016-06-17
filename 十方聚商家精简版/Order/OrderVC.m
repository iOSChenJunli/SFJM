//
//  OrderVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/16.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "OrderVC.h"
#import "BaseOrderBtn.h"
#import "packageOrderDetailCell.h"
#import "ValidateDetailTabVC.h"
#import "OrderDetailVC.h"
@interface OrderVC ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL flg[1000];
    NSArray *dataArr;
}
@property (weak, nonatomic) IBOutlet UIView *TopView;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UITableView *orderTableView;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end

@implementation OrderVC
- (IBAction)topBtnClick:(id)sender {
     BaseOrderBtn *selectBtn =(BaseOrderBtn *)sender;
    for (id subview in _TopView.subviews) {
        if ([subview isKindOfClass:[BaseOrderBtn class]]) {
            BaseOrderBtn *subBtn=(BaseOrderBtn *)subview;
            [subBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            subBtn.RightDownLayer.fillColor=[BasicMerhod colorWithHexString:@"DDDDDD"].CGColor;
            if (selectBtn.tag==subBtn.tag) {
                [subBtn setTitleColor:[BasicMerhod colorWithHexString:@"F04F0A"] forState:UIControlStateNormal];
                subBtn.RightDownLayer.fillColor=[BasicMerhod colorWithHexString:@"F04F0A"].CGColor;
                
            }

        }
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _orderTableView.delegate=self;
    _orderTableView.dataSource=self;
    _searchBtn.layer.borderWidth=1.0f;
    _searchBtn.layer.backgroundColor= [BasicMerhod colorWithHexString:@"f0f0f0"].CGColor;
    
    dataArr= @[@"",@"",@"",@"",@"",@"",@"",@"",@""];
    [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        flg[idx]=YES;
    }];
    
    self.orderTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.orderTableView.mj_header endRefreshing];
    }];
    
    self.orderTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.orderTableView.mj_footer endRefreshing];
    }];
}

#pragma mark - TableViewDelegae And dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (flg[section]) {
        return 1;
    }else{
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 40;
    }else{
        return 185;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell" forIndexPath:indexPath];
        return cell;
    }else{
        packageOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderDetailCell" forIndexPath:indexPath];
        cell.varLabTit1.text =@"测试";
        [cell setGoToVerify:^{
            //去验证
            ValidateDetailTabVC *validateDetailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ValidateDetailTabVC"];
            validateDetailVC.isHaveSerialNumber=YES;
            [self.navigationController pushViewController:validateDetailVC animated:YES];
            
        }];
        [cell setGoToOrderDetail:^{
            //查看订单详情
            OrderDetailVC *orderDetailVC= [self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailVC"];
            orderDetailVC.orderType = orderMeal;
            orderDetailVC.payType = 1;
            [self.navigationController pushViewController:orderDetailVC animated:YES];
        }];
        return cell;
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    flg[indexPath.section]=flg[indexPath.section]?NO:YES;
    [tableView reloadData];
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
