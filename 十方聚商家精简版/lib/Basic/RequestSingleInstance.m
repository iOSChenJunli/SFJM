//
//  RequestSingleInstance.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/11.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "RequestSingleInstance.h"
static RequestSingleInstance * instance;
@implementation RequestSingleInstance

+(id)shareRequestInstanse{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance =[[RequestSingleInstance alloc]init];
    });
    return instance;
}

-(void)PostLoadingInViewController:(UIViewController *)viewController  parameters:(NSDictionary *)parameters
                    dealWithBlock : (void (^)(id responseObject , NSError * error))dealBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:httpUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *status = responseObject[@"status"];
        //[SVProgressHUD show];
        switch ([status integerValue]) {
            case 1:
            {
                NSError *error =nil;
                dealBlock(responseObject,error);
            }
                return;
            case -1:
                SVProgressHUDShowWithStatus(@"参数错误");
                break;
            case -2:
                 SVProgressHUDShowWithStatus(@"token错误");
                break;
            case -3:
                 SVProgressHUDShowWithStatus(@"用户未登录");
                break;
            case -4:
                 SVProgressHUDShowWithStatus(@"权限不足");
                break;
            case -5:
                 SVProgressHUDShowWithStatus(@"超时");
                //[SVProgressHUD showWithStatus:@""];
                break;
            case -997:
                SVProgressHUDShowWithStatus(@"无此商家");
                break;
            case -998:
                // SVProgressHUDShowWithStatus(@"累计 5 次错误尝试，15 分钟内您将不能登录。");
                SVProgressHUDShowWithStatus(responseObject[@"msg"])
                break;
            default:
                 SVProgressHUDShowWithStatus(@"未知错误");
                break;
        }
        SVProgressHUDismissWithDelayed(0.5);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dealBlock (nil , error);
    }];
}

@end
