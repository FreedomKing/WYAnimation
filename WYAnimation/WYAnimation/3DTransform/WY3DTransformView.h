//
//  UserAchievementDetailView.h
//  IPostCarService
//
//  Created by yingwang on 16/7/22.
//  Copyright © 2016年 dg11185. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WY3DTransformView;
@protocol WY3DTransformViewDelegate <NSObject>

@optional
- (void)transformView:(WY3DTransformView *)transformView didTouchCloseButton:(UIButton *)button;
@end


@interface WY3DTransformView : UIView


@property (nonatomic, weak) id<WY3DTransformViewDelegate> delegate;
/**
 *	展示某个类型的表单详情页
 *
 *	@param viewType	视图类型
 *	@param delegate	代理方法
 *	@param orderData	数据
 */
+ (void)showTransformView;

@end

@interface WY3DTransformContainView : WY3DTransformView
@end

