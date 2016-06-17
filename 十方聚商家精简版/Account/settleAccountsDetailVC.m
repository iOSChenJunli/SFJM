//
//  settleAccountsDetailVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/10.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "settleAccountsDetailVC.h"
#import "headCollectionCell.h"
@interface settleAccountsDetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    BOOL flg[1000];
}
@property (weak, nonatomic) IBOutlet UICollectionView *headCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic)NSArray *dataMArr;// 数据源
@property (nonatomic ,assign)NSInteger selectIndex;


@end

@implementation settleAccountsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataMArr=@[@"2016",@"2017",@"2018",@"2019",@"2010",@"2011",@"2012",@"2013",@"2014"];
  [_dataMArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      flg[idx]=YES;
  }];
    _selectIndex=0;
    _headCollectionView.delegate=self;
    _headCollectionView.dataSource=self;
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.tableFooterView =[[UIView alloc]init];
    
}

#pragma mark - Collection View Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataMArr.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *collectionCellID = @"myCollectionCell";
     headCollectionCell *cell = (headCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    if (indexPath.row==_selectIndex) {
        cell.contentView.backgroundColor=[BasicMerhod colorWithHexString:@"F04F0A"];
        cell.titleLabel.textColor= [UIColor whiteColor];
    }else{
        cell.contentView.backgroundColor=[UIColor whiteColor];
        cell.titleLabel.textColor =[BasicMerhod colorWithHexString:@"333333"];
    }
    NSString *title      = _dataMArr[indexPath.row];
    cell.titleLabel.text = title;
    
    return cell;
};
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kScreenWidth/4, 40);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndex=indexPath.row;
   [_headCollectionView reloadData];
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
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
        return 120;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell" forIndexPath:indexPath];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountDetailCell" forIndexPath:indexPath];
        return cell;
    }
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (flg[indexPath.section]) {
        flg[indexPath.section]=NO;
    }else{
        flg[indexPath.section]=YES;
    }
    //局部section刷新
    NSIndexSet * nd=[[NSIndexSet alloc]initWithIndex:indexPath.section];//刷新第二个section
    [_myTableView reloadSections:nd withRowAnimation:UITableViewRowAnimationAutomatic];
//    [_myTableView reloadData];
    
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
