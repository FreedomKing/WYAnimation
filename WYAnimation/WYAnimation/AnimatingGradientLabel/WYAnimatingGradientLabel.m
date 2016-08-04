//
//  WYAnimatingGradientLabelView.m
//  WYAnimation
//
//  Created by yingwang on 16/8/4.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "WYAnimatingGradientLabel.h"

@interface WYAnimatingGradientLabel ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) NSAttributedString *attributeText;

@end

@implementation WYAnimatingGradientLabel

- (void)drawRect:(CGRect)rect {
    //1.initialize gradient layer
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = CGRectMake(-CGRectGetWidth(self.bounds), 0, 3*CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    NSLog(@"rect = %@", NSStringFromCGRect(self.bounds));
    
    _gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    _gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    //1.1 set colors for gradient
    NSArray *colors = @[(id)[UIColor blackColor].CGColor, (id)[UIColor magentaColor].CGColor, (id)[UIColor redColor].CGColor, (id)[UIColor yellowColor].CGColor, (id)[UIColor cyanColor].CGColor, (id)[UIColor purpleColor].CGColor, (id)[UIColor blackColor].CGColor];
    _gradientLayer.colors = colors;
    
    //1.3 set locations for gradient
    NSArray *locations = @[@(0.05), @(0.125), @(0.375), @(0.5), @(0.625), @(0.875), @(0.925)];
    _gradientLayer.locations = locations;
    
    [self.layer addSublayer:_gradientLayer];

    //2.draw text image
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [self.attributeText drawInRect:self.bounds];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //3.make a mask layer from text image above
    CALayer *maskLayer = [CALayer layer];
    maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    maskLayer.frame = CGRectOffset(self.bounds, CGRectGetWidth(self.bounds), 0);
    maskLayer.contents = (__bridge id _Nullable)(img.CGImage);
    _gradientLayer.mask = maskLayer;
    
    //4.add animation
    CABasicAnimation *bsAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    // 4.1 colors location when begining
    bsAnimation.fromValue = @[@(0.0), @(0.0), @(0.0), @(0.0), @(0.0), @(0.25), @(0.30)];
    // 4.2 colors location when ending
    bsAnimation.toValue = @[@(0.6), @(0.65), @(0.70), @(0.80), @(0.90), @(0.95), @(1.0)];
    bsAnimation.duration = 3;
    bsAnimation.repeatCount = INFINITY;
    
    [_gradientLayer addAnimation:bsAnimation forKey:nil];
}

- (NSAttributedString *)attributeText {
    
    _text = @"Gradient Label";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:24.0
                                                                       weight:0.1],
                                 NSParagraphStyleAttributeName:style
                                 };
    _attributeText = [[NSAttributedString alloc] initWithString:_text
                                                     attributes:attributes];
    return _attributeText;
}

@end
