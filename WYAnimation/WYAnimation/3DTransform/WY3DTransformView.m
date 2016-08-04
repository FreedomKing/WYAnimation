//
//  UserAchievementDetailView.m
//  IPostCarService
//
//  Created by yingwang on 16/7/22.
//  Copyright © 2016年 dg11185. All rights reserved.
//

#import "WY3DTransformView.h"

@interface WY3DTransformView () <WY3DTransformViewDelegate>

@property (nonatomic, strong) UIWindow *privateWindow;//私有window窗口
@property (nonatomic, strong) UIView *backgroundShadowView;//被禁遮罩层
@property (nonatomic, strong) WY3DTransformContainView *containView;//保险详情页
@property (nonatomic, weak) WY3DTransformView *currentView;//临时变量，最近一次展示的视图

@end

@implementation WY3DTransformView

+ (instancetype)shareView {
    
    static dispatch_once_t onceQueue;
    static WY3DTransformView *singleInstance;
    dispatch_once(&onceQueue, ^{
        singleInstance = [[WY3DTransformView alloc] init];
    });
    return singleInstance;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _privateWindow  = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _privateWindow.windowLevel = UIWindowLevelStatusBar;
        _privateWindow.backgroundColor = [UIColor clearColor];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:_privateWindow.frame];
        backgroundView.backgroundColor = [UIColor darkGrayColor];
        backgroundView.alpha = 0.0;
        [_privateWindow addSubview:backgroundView];
        _backgroundShadowView = backgroundView;
    }
    return self;
}

- (void)layoutSubviews {
    
    //设置圆角
    self.layer.cornerRadius = 2;
    //设置阴影
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowRadius = 1;
    self.layer.shadowOffset = CGSizeMake(2, -2);
    self.layer.shadowOpacity = 0.7;

}

+ (void)showTransformView {
    
    WY3DTransformView *instance = [WY3DTransformView shareView];
    instance.currentView = [instance setupContainView];
    [instance showDetailView];
}

- (void)showDetailView {
    
    [self.privateWindow addSubview:self.currentView];
    [self.privateWindow setHidden:NO];
    [self.privateWindow makeKeyAndVisible];
    //设置初始变换
    self.currentView.layer.transform = [self specialTransform3D];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:0
                     animations:^{
                         //调整背景遮罩的透明度
                         self.backgroundShadowView.alpha = 0.6;
                         //设置抗锯齿为真
                         self.currentView.layer.allowsEdgeAntialiasing = YES;
                         self.currentView.layer.speed = 1.0;
                         //展开视图
                         self.currentView.layer.transform = CATransform3DIdentity;
                     }
                     completion:^(BOOL finished) {}];
}
/**
 *	关闭视图
 */
+ (void)dismissDetailView {
    
    WY3DTransformView *instance = [WY3DTransformView shareView];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:0
                     animations:^{
                         //恢复背景遮罩的透明度为0
                         instance.backgroundShadowView.alpha = 0.0;
                         //收回视图
                         instance.currentView.layer.transform = [instance specialTransform3D];
                         //关闭抗锯齿
                         instance.currentView.layer.allowsEdgeAntialiasing = YES;
                     } completion:^(BOOL finished) {
                         [instance.currentView removeFromSuperview];
                         instance.privateWindow.hidden = YES;
                         [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
                     }];
}

- (WY3DTransformView *)setupContainView {
    
    return self.containView;
}

- (CATransform3D)specialTransform3D {
    
    //初始化3D变换
    CATransform3D transform = CATransform3DIdentity;
    //设置透视值
    transform.m34 = - 1.0 / 500.0;
    //设置旋转变换
    transform = CATransform3DRotate(transform, M_PI_2, 0.75, 1.0, -0.5);
    //缩放变换
    transform = CATransform3DScale(transform, 0.01, 0.01, 0.01);
    
    return transform;
}

#pragma mark - getter and setter
- (WY3DTransformContainView *)containView {
    //懒加载
    if (!_containView) {
        //底部距离
        CGFloat bottomMargin = 10;
        //左右边距
        CGFloat leftRightMargin = 10;
        //高度
        CGFloat viewHeight = 330;
        CGFloat viewWidth = CGRectGetWidth(_privateWindow.frame) - 2*leftRightMargin;
        CGFloat xPosition = leftRightMargin;
        CGFloat yPosition = CGRectGetHeight(_privateWindow.frame) - viewHeight - bottomMargin;
        
        //视图框架
        CGRect frame = CGRectMake(xPosition+viewWidth/2, yPosition-viewHeight/2, viewWidth, viewHeight);
        _containView = [[[NSBundle mainBundle] loadNibNamed:@"WY3DTransformContainView" owner:nil options:nil] firstObject];
        [_containView setFrame:frame];
        //设置动画锚点
        _containView.layer.anchorPoint = CGPointMake(1, 0);
        _containView.delegate = self;
    }
    
    return _containView;
}

#pragma mark - delegate
- (void)transformView:(WY3DTransformView *)transformView didTouchCloseButton:(UIButton *)button {
    
    //关闭窗口
    [WY3DTransformView dismissDetailView];
    //通知上层代理
    if ([self.delegate respondsToSelector:@selector(transformView:didTouchCloseButton:)]) {
        [self.delegate transformView:self didTouchCloseButton:button];
    }
}

@end

@interface WY3DTransformContainView ()
@end

@implementation WY3DTransformContainView

- (IBAction)respondToCloseButton:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(transformView:didTouchCloseButton:)]) {
        [self.delegate transformView:self didTouchCloseButton:sender];
    }
}

@end



