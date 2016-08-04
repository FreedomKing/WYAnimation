//
//  WYAUpwardEmitterView.m
//  WYAnimation
//
//  Created by yingwang on 16/7/29.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "WYAUpwardEmitterView.h"

@interface WYAUpwardEmitterView ()

@property (nonatomic, strong) CAEmitterLayer *upwardEmitterLayer;

@end

@implementation WYAUpwardEmitterView

- (void)startAnimation {
    
    [super startAnimation];
    [self.upwardEmitterLayer setHidden:NO];
}

- (void)stopAnimation {
    
    [super stopAnimation];
    [self.upwardEmitterLayer setHidden:YES];
}

- (CAEmitterLayer *)upwardEmitterLayer {
    
    if (!_upwardEmitterLayer) {
        
        CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
        //1.set emitter location
        emitterLayer.emitterPosition = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
        //2.set emitter size
        emitterLayer.emitterSize = CGSizeMake(30, 30);
        //3.set the order that cell composited
        emitterLayer.renderMode = kCAEmitterLayerUnordered;
        //4.initialize cell array
        NSMutableArray *cells = [NSMutableArray array];
        
        //5.initialize cell
        CAEmitterCell *cell = [CAEmitterCell emitterCell];
        //6.set cell image
        cell.contents = (__bridge id)[[UIImage imageNamed:@"bone_30x30"] CGImage];
        
        cell.birthRate = 5;
        cell.lifetime =  10;
        
        cell.velocity = 200;
        cell.velocityRange = 50;
        cell.emissionRange = (CGFloat) M_PI*2;
        cell.emissionLongitude = (CGFloat) M_PI + M_PI_2;
        
        //differ color
        cell.color = [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0] CGColor];
        cell.redRange = 0.5;
        cell.blueRange = 0.5;
        cell.greenRange = 0.5;
        //加速度
        cell.yAcceleration = 50;
        
        cell.spinRange = 10.0;
        cell.scale = 0.5;
        cell.scaleRange = 0.2;
        
        [cells addObject:cell];
        //7.set cells to emitter
        emitterLayer.emitterCells = cells;
        //8.add to view's layer
        [self.layer addSublayer:emitterLayer];
        _upwardEmitterLayer = emitterLayer;
    }
    return _upwardEmitterLayer;
}

@end
