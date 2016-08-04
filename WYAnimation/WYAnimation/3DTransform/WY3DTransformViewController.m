//
//  WY3DTransformViewController.m
//  WYAnimation
//
//  Created by yingwang on 16/8/4.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "WY3DTransformViewController.h"
#import "WY3DTransformView.h"

@interface WY3DTransformViewController ()

@end

@implementation WY3DTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    btn.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)-20);
    [btn addTarget:self action:@selector(startAnimtaion:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"begin 3D Transform" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)startAnimtaion:(id)sender {
    
    [WY3DTransformView showTransformView];
}


@end
