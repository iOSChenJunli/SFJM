//
//  HomeTabVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/9.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "HomeTabVC.h"
#import "codeImageView.h"
#import "BigCodeVC.h"
@interface HomeTabVC ()<UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *tableHeaderView;
    
    __weak IBOutlet UIPageControl *pageControl;
    
    NSArray * bannerImageURLArray;
    
    NSTimer * bannerTimer;
}
@property (weak, nonatomic) IBOutlet UIView *headTabView;
@property (weak, nonatomic) IBOutlet codeImageView *merchantsCode;
@property (weak, nonatomic) IBOutlet UILabel *orderMealLab;


@end

@implementation HomeTabVC
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [bannerTimer invalidate];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    bannerTimer =  [NSTimer scheduledTimerWithTimeInterval:3.f target:self selector:@selector(bannerTimer) userInfo:nil repeats:YES];
//    [[self navigationController] setNavigationBarHidden:YES animated:[[[NSUserDefaults standardUserDefaults] objectForKey:@"BarHiddenAnimate"] boolValue]];
//    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"BarHiddenAnimate"];
    
//   NSLog(@"%@",RequestToken);
//    if (!RequestToken) {
//        RequestSingleInstance * instance = [RequestSingleInstance shareRequestInstanse];
//        instance.token = [BasicMerhod returnTokenWithUserID:@"45"];
//    }
//    
//    NSLog(@"%@",orderlist(@"dinner",[BasicMerhod createCurrentTimeWithType:dateOnlyHorizonLine]));
    _merchantsCode.codeString=@"测测验证码";
    _orderMealLab.layer.borderColor=[BasicMerhod colorWithHexString:@"666666"].CGColor;
    _orderMealLab.layer.borderWidth = 1.0f;
    _orderMealLab.layer.cornerRadius = 5.0f;
    
    [[RequestSingleInstance shareRequestInstanse]PostLoadingInViewController:self  parameters:Login(@"123456", @"123456") dealWithBlock:^(id responseObject, NSError *error) {
        SVProgressHUDShowWithStatus(responseObject[@"msg"]);
        SVProgressHUDismissWithDelayed(0.5);
        NSLog(@"%@",responseObject);
        
    }];
//    [[RequestSingleInstance shareRequestInstanse]PostLoadingInViewController:self parameters:orderlist(@"dinner",[BasicMerhod createCurrentTimeWithType:dateOnlyHorizonLine]) dealWithBlock:^(id responseObject, NSError *error) {
//        NSLog(@"%@",responseObject);
//    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self.tableView.mj_header endRefreshing];
    }];
    
    
    _headTabView.frame=CGRectMake(0, 0, kScreenWidth, kScreenWidth*105/245+kScreenWidth+135+10);
    bannerImageURLArray = [[NSArray alloc]init];
    bannerImageURLArray = @[@"banner_pic1.jpg",@"menu_banner_pic1.jpg",@"proLis_banner_pic.jpg"];
    [self createShufflingView];
}
- (void)createShufflingView{
    tableHeaderView.delegate = self;
    tableHeaderView.contentSize = CGSizeMake(kScreenWidth*(bannerImageURLArray.count+2),kScreenWidth*105/245);
    
    for (int i = 0; i < bannerImageURLArray.count+2; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenWidth*141/320)];
        imageView.backgroundColor = [UIColor colorWithRed:192/255.f green:151/255.f blue:77/255.f alpha:.5];
        if (i==0) {
            
            imageView.image=[UIImage imageNamed:bannerImageURLArray[bannerImageURLArray.count-1]];
            
            //            [imageView sd_setImageWithURL:[NSURL URLWithString:[bannerImageURLArray objectAtIndex:bannerImageURLArray.count-1]] placeholderImage:[UIImage imageNamed:@"banner_default"]];
        }else if (i==(bannerImageURLArray.count+1)){
            imageView.image=[UIImage imageNamed:bannerImageURLArray[0]];
            //            [imageView sd_setImageWithURL:[NSURL URLWithString:[bannerImageURLArray objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"banner_default"]];
        }
        else
        {
            imageView.image=[UIImage imageNamed:bannerImageURLArray[i-1]];
            //            [imageView sd_setImageWithURL:[NSURL URLWithString:[bannerImageURLArray objectAtIndex:i-1]] placeholderImage:[UIImage imageNamed:@"banner_default"]];
        }
        [tableHeaderView addSubview:imageView];
    }
    
    pageControl.numberOfPages = bannerImageURLArray.count;
    
    pageControl.userInteractionEnabled=YES;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    
    [tableHeaderView setContentOffset:CGPointMake(kScreenWidth, 0) animated:NO];
    
   
}
#pragma mark - scroll view data source

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == tableHeaderView)
    {
        NSLog(@"%f",scrollView.contentOffset.x);
        if ((scrollView.contentOffset.x)/kScreenWidth==0) {
            pageControl.currentPage = bannerImageURLArray.count-1;
            [tableHeaderView setContentOffset:CGPointMake(kScreenWidth * bannerImageURLArray.count, 0) animated:NO];
        }else if ((scrollView.contentOffset.x)/kScreenWidth==bannerImageURLArray.count+1){
            pageControl.currentPage = 0;
            [tableHeaderView setContentOffset:CGPointMake(kScreenWidth, 0) animated:NO];
        }
        else
        {
            pageControl.currentPage = (scrollView.contentOffset.x)/kScreenWidth-1;
        }
    }
    
}

-(void)bannerTimer
{
    NSLog(@"%ld",(long)pageControl.currentPage+1);
    NSInteger page = pageControl.currentPage;
    page ++;
    page = page > bannerImageURLArray.count - 1?0:page;
    pageControl.currentPage = page;
    [self turnPage];
    
}
#pragma mark -pageControl
- (void)turnPage
{
    NSInteger page = pageControl.currentPage;
    [tableHeaderView scrollRectToVisible:CGRectMake(kScreenWidth*(page + 1),0, kScreenWidth, kScreenWidth*141/320) animated:NO];
}


//查看二维码
- (IBAction)checkQCodeTap:(id)sender {
    BigCodeVC *bigCodeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BigCodeVC"];
    bigCodeVC.codeString = @"验证码大图";
    [self.navigationController pushViewController:bigCodeVC animated:YES];
}

@end
