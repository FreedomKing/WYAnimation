//
//  WYAEmitterViewController.m
//  WYAnimation
//
//  Created by yingwang on 16/8/4.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "WYAEmitterViewController.h"
#import "WYAUpwardEmitterView.h"

@interface WYAEmitterViewController ()

@property (nonatomic, strong) WYAEmitterView *emitterView;

@end

@implementation WYAEmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _emitterView = [[WYAUpwardEmitterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_emitterView];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 40)];
    btn.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)-20);
    [btn addTarget:self action:@selector(startAnimtaion:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)startAnimtaion:(id)sender {
    
    [_emitterView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end