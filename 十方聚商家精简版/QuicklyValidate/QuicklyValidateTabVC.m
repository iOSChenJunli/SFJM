//
//  QuicklyValidateTabVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/16.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "QuicklyValidateTabVC.h"
#import "ValidateDetailTabVC.h"
#import "ScanCodeVC.h"
@interface QuicklyValidateTabVC ()

@end

@implementation QuicklyValidateTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

#pragma mark - Table view data source

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 10;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuicklyValidateCell" forIndexPath:indexPath];
//    return cell;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 120;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        ValidateDetailTabVC *validateDetailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ValidateDetailTabVC"];
        validateDetailVC.index =indexPath.row;
        validateDetailVC.isHaveSerialNumber=NO;
        [self.navigationController pushViewController:validateDetailVC animated:YES];
    }else{
        ScanCodeVC *scanCodeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScanCodeVC"];
        scanCodeVC.isOrderType = YES;
        [self.navigationController pushViewController:scanCodeVC animated:YES];
    }
      
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue destinationViewController]isKindOfClass:[ValidateDetailTabVC class]]) {
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath= [self.tableView indexPathForCell:cell];
        ValidateDetailTabVC *vc = (ValidateDetailTabVC *)[segue destinationViewController];
        vc.index =indexPath.row;
        
    }
}

@end
