//
//  RequestPasswordVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/14.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "RequestPasswordVC.h"
#import "ChangePasswordVC.h"
@interface RequestPasswordVC ()
{
    int time ;
    NSTimer * onTimer;
}
@property (weak, nonatomic) IBOutlet UIButton *GetCodeBtn;

@end

@implementation RequestPasswordVC
-(void)viewDidDisappear:(BOOL)animated
{
//    if ([onTimer isValid]) {
//        [onTimer invalidate];
//    }
    [super viewDidDisappear:animated];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    time = 60;
    _GetCodeBtn.layer.borderColor=[BasicMerhod colorWithHexString:@"F04F0A"].CGColor;
    _GetCodeBtn.layer.borderWidth=1.0f;
}

- (IBAction)GetCodeBtnClick:(id)sender {

    self.GetCodeBtn.enabled = NO;
    [self startTimer];
}

-(void)startTimer
{
    
    UIApplication *app = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid) {
                [app endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        onTimer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:onTimer forMode:NSRunLoopCommonModes];
        
        [[NSRunLoop currentRunLoop] run];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid) {
                [app endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
    
}

-(void)onTimer
{
    if (time >= 1)
    {
        self.GetCodeBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [self.GetCodeBtn setTitle:[NSString stringWithFormat:@"%ds后重新获取",time--] forState:UIControlStateDisabled];
    }
    else
    {
        [onTimer invalidate];
        self.GetCodeBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        time = 60;
        self.GetCodeBtn.enabled = YES;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue destinationViewController]isKindOfClass:[ChangePasswordVC class]]) {
        ChangePasswordVC *vc = (ChangePasswordVC *)[segue destinationViewController];
        vc.phone=@"15868154286";
    }

}


@end
