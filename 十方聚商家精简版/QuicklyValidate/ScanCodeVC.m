//
//  ScanCodeVC.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/20.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "ScanCodeVC.h"
#import <AVFoundation/AVFoundation.h>
//#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScanWidth 200
#define lineTop 120
#define PreviewWidth 160
@interface ScanCodeVC ()<AVCaptureMetadataOutputObjectsDelegate>{
    
    UIImageView *_scanView;
    UITextView *_resultTextView;
    UIImageView *_line;
    
    BOOL _upOrdown;
    NSTimer *_timer;
    int _num;
    
    AVCaptureDevice * device;
    AVCaptureDeviceInput * input;
    AVCaptureMetadataOutput * output;
    AVCaptureSession * session;
    AVCaptureVideoPreviewLayer * preview;
}


@end

@implementation ScanCodeVC
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [session stopRunning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
    [self buildCamera];
}

-(void)initSubviews{
    self.view.backgroundColor = [BasicMerhod colorWithHexString:@"616161"];
    _scanView = [[UIImageView alloc] init];
    _scanView.frame = CGRectMake((kScreenWidth-ScanWidth)/2, 100, ScanWidth, ScanWidth);
    //_scanView.backgroundColor=[BasicMerhod colorWithHexString:@"f0f0f0"];
    _scanView.image = [UIImage imageNamed:@"bg_scanner"];
    [self.view addSubview:_scanView];
    
    _upOrdown = NO;
    _num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-ScanWidth)/2, lineTop,ScanWidth , 1)];
    _line.backgroundColor = [UIColor greenColor];
    _line.layer.cornerRadius = 8;
    [self.view addSubview:_line];
    
    UILabel *describeLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 140, 50)];
    describeLab.center=CGPointMake(self.view.center.x, _scanView.frame.origin.y+_scanView.frame.size.height+30);
    describeLab.font = [UIFont systemFontOfSize:15];
    describeLab.textColor= [UIColor whiteColor];
    describeLab.text=_isOrderType?@"扫一扫用户端二维码进行验证":@"扫一扫用户消费二维码进行支付";
    describeLab.textAlignment=NSTextAlignmentCenter;
    describeLab.numberOfLines=2;
    [self.view addSubview:describeLab];
    
    
    
    
}
-(void)scanAnimation
{
    if (_upOrdown == NO) {
        _num ++;
        [UIView animateWithDuration:.1 animations:^{
            
            _line.frame = CGRectMake((kScreenWidth-ScanWidth)/2, lineTop+2*_num, ScanWidth, 1);
        }];
        
        
        if (2*_num >= 160) {
            _upOrdown = YES;
        }
    }
    else {
        _num --;
        [UIView animateWithDuration:.1 animations:^{
            
            _line.frame = CGRectMake((kScreenWidth-ScanWidth)/2, lineTop+2*_num, ScanWidth, 1);
        }];
        
        
        if (_num == 0) {
            _upOrdown = NO;
        }
    }
    
}

- (void)buildCamera
{
    if (!device) {
        device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    
    if (!input) {
        input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    }
    
    if (!output) {
        output = [[AVCaptureMetadataOutput alloc]init];
        [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    }
    
    if (!session) {
        session = [[AVCaptureSession alloc]init];
        [session setSessionPreset:AVCaptureSessionPresetHigh];
    }
    
    if ([session canAddInput:input])
    {
        [session addInput:input];
    }
    
    if ([session canAddOutput:output])
    {
        [session addOutput:output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    // 预览层
    if (!preview) {
        preview = [AVCaptureVideoPreviewLayer layerWithSession:session];
        preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
        preview.frame = CGRectMake((kScreenWidth-PreviewWidth)/2,
                                   lineTop,
                                   PreviewWidth,
                                   PreviewWidth);
        
        preview.backgroundColor = [UIColor orangeColor].CGColor;
        [self.view.layer insertSublayer:preview atIndex:0];
    }
    
    
    _resultTextView.text = @"";
    if (!_timer.isValid) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(scanAnimation) userInfo:nil repeats:YES];
    }
    
    [session startRunning];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0){
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [session stopRunning];
    
    _resultTextView.text = stringValue;
    _line.hidden = YES;
    [_timer invalidate];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"扫码成功" preferredStyle:UIAlertControllerStyleAlert];
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2.0];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dismiss{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
