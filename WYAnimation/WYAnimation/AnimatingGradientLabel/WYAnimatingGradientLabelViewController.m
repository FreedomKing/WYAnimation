//
//  WYAnimatingGradientViewController.m
//  WYAnimation
//
//  Created by yingwang on 16/8/4.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "WYAnimatingGradientLabelViewController.h"
#import "WYAnimatingGradientView.h"

@interface WYAnimatingGradientLabelViewController ()

@property (nonatomic, strong) WYAnimatingGradientView *mainView;

@end

@implementation WYAnimatingGradientLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainView = [[[NSBundle mainBundle] loadNibNamed:@"WYAnimatingGradientView" owner:nil options:nil] firstObject];
    _mainView.frame = self.view.bounds;
    [self.view addSubview:_mainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
