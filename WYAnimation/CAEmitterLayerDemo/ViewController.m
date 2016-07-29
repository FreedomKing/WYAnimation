//
//  ViewController.m
//  CAEmitterLayerDemo
//
//  Created by yingwang on 16/7/29.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "ViewController.h"
#import "WYAUpwardEmitterView.h"

@interface ViewController ()

@property (nonatomic, strong) WYAEmitterView *emitterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _emitterView = [[WYAUpwardEmitterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_emitterView];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 40)];
    [btn addTarget:self action:@selector(startAnimtaion:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"start" forState:UIControlStateNormal];
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
