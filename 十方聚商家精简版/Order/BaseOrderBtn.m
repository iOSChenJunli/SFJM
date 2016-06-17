//
//  BaseOrderBtn.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/20.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "BaseOrderBtn.h"

@implementation BaseOrderBtn
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {        
        _RightDownLayer = [CAShapeLayer layer];
        _RightDownLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        if (self.tag==100) {
            self.RightDownLayer.fillColor=[BasicMerhod colorWithHexString:@"F04F0A"].CGColor;
        }else{
            self.RightDownLayer.fillColor=[BasicMerhod colorWithHexString:@"DDDDDD"].CGColor;
        }
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height-15)];
        [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
        [path addLineToPoint:CGPointMake(self.bounds.size.width-15, self.bounds.size.height)];
        [path closePath];
        self.RightDownLayer.path=path.CGPath;
        [self.layer addSublayer:_RightDownLayer];
        
    
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
