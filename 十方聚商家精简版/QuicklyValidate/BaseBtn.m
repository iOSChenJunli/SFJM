//
//  BaseBtn.m
//  十方聚商家精简版
//
//  Created by YideNet on 16/5/18.
//  Copyright © 2016年 YideNet. All rights reserved.
//

#import "BaseBtn.h"

@implementation BaseBtn
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.borderColor=\
        (self.bounds.size.width==self.bounds.size.height)?[UIColor blackColor].CGColor:[UIColor greenColor].CGColor;
        self.layer.borderWidth=0.5f;
        self.layer.cornerRadius= self.bounds.size.height/2;
    }
    return self;
}

@end
