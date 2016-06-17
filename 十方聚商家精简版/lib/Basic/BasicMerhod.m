//
//  BasicMerhod.m
//  SFJ
//
//  Created by YideNet on 16/4/12.
//  Copyright © 2016年 SFJ. All rights reserved.
//

#import "BasicMerhod.h"
#import "MyMD5.h"

CGFloat kScreenWidth	= 0.0;
CGFloat kScreenHeight = 0.0;
CGFloat kStatusBarHeight = 0.0f;
CGFloat kTabBarHeight = 49.0f;
CGFloat NAV_BAR_HEIGHT = 44.0;
@implementation BasicMerhod
+(void)initGlobalValue
{
    if(iPhone6plus)
    {
        //equal or higher than iOS7
        //        iOSPlatform	= 8;
        kScreenWidth = [[UIScreen mainScreen] bounds].size.width;
        kScreenHeight = [[UIScreen mainScreen] bounds].size.height;
        kStatusBarHeight = 27.0f;
        NAV_BAR_HEIGHT = 64.0;
        //        NAV_BG_IMAGE = @"nav";
        kTabBarHeight = 49.0f;
    }
    else
    {
        //        iOSPlatform	= 7;
        kScreenWidth = [[UIScreen mainScreen] bounds].size.width;
        kScreenHeight = [[UIScreen mainScreen] bounds].size.height;
        kStatusBarHeight = 20.0f;
        NAV_BAR_HEIGHT = 64.0;
        //        NAV_BG_IMAGE = @"nav";
        kTabBarHeight = 49.0f;
    }
}

+(UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

//当前时间---->时间戳
+(NSString*)createCurrentTimeToTimestamp
{
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];
    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}


//时间戳---->时间
+(NSString*)parsingTheTimestamp:(NSString *)timestamp type:(timeStampType)type
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    
    if (type == withSecond)
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    else if (type == dateOnlyHorizonLine)
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    else if (type == dateOnlySlashLine)
    {
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    }
    
    NSDate *theday = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSString *day = [dateFormatter stringFromDate:theday];
    
    return day;
}
+(NSString *)createCurrentTimeWithType:(timeStampType)type{
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateFormatter=[[NSDateFormatter alloc] init];
    
    if (type == withSecond)
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    else if (type == dateOnlyHorizonLine)
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    else if (type == dateOnlySlashLine)
    {
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    }else{
        
        [dateFormatter setDateFormat:@"YYYYMMdd"];
        
    }

    NSString *  locationString=[dateFormatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    
    return locationString;
}

+(NSString*)returnTokenWithUserID:(NSString *)uid{
  NSString * tmpStr = [NSString stringWithFormat:@"%@%@ydwl89020001",uid,[BasicMerhod createCurrentTimeWithType:dateYMD]];
  tmpStr = [MyMD5 md5:tmpStr];
  return tmpStr;
}


@end
