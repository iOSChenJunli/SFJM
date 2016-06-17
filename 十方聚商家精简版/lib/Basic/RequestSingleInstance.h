//
//  RequestSingleInstance.h
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/11.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestSingleInstance : NSObject
@property (nonatomic , strong) NSString *token;
//用户id
@property (nonatomic , strong) NSString *userID;


+(id)shareRequestInstanse;

-(void)PostLoadingInViewController:(UIViewController *)viewController parameters:(NSDictionary *)parameters
                    dealWithBlock : (void (^)(id responseObject , NSError * error))dealBlock;

@end
