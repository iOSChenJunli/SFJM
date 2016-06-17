//
//  BasicMerhod.h
//  SFJ
//
//  Created by YideNet on 16/4/12.
//  Copyright © 2016年 SFJ. All rights reserved.
//

#import <Foundation/Foundation.h>
extern CGFloat kScreenWidth;
extern CGFloat kScreenHeight;
extern CGFloat kStatusBarHeight;
extern CGFloat kTabBarHeight;
extern CGFloat NAV_BAR_HEIGHT;

#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 || [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)

#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define concurrentQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

//提示框 SVProgressHUD show
#define SVProgressHUDShowWithStatus(msg) [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];\
[SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];\
[SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];\
[SVProgressHUD showWithStatus: msg];\

//SVProgressHUD dismiss
#define SVProgressHUDismissWithDelayed(delayed)\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayed * NSEC_PER_SEC)), concurrentQueue, ^{\
dispatch_async(concurrentQueue, ^{\
dispatch_async(dispatch_get_main_queue(), ^{\
[SVProgressHUD dismiss];\
});\
});\
});\


typedef enum
{
    withSecond = 0,
    dateOnlyHorizonLine ,
    dateOnlySlashLine ,
    dateYMD
} timeStampType;

typedef enum
{
    package = 0,
    orderMeal ,
    discount
    
} OrderType;

typedef enum
{
    notPay = 0,
    havePay ,
    completePay
} PayType;

@interface BasicMerhod : NSObject
/* 时间------>时间戳 */
+(NSString*)createCurrentTimeToTimestamp;

/* 时间戳------>时间 */
+(NSString*)parsingTheTimestamp:(NSString*)timestamp type:(timeStampType)type;

+(NSString *)createCurrentTimeWithType:(timeStampType)type;
/* token */
+(NSString*)returnTokenWithUserID:(NSString *)uid;

+(UIColor *)colorWithHexString:(NSString *)color;

+(void)initGlobalValue;
@end
