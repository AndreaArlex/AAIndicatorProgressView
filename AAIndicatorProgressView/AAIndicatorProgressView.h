//
//  AAIndicatorProgressView.h
//  AAIndicatorProgressDemo
//
//  Created by Arlexovincy on 15/3/26.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAIndicatorProgressView : UIView{

    UIColor *mbackColor,*mprogressColor;
    float mlineWidth;
    CAShapeLayer *backLayer,*progressLayer;
    BOOL misClockWise;
}

- (id)initWithFrame:(CGRect)frame backColor:(UIColor*)backColor progressColor:(UIColor*)progressColor lineWidth:(float)lineWidth isClockWise:(BOOL)isClockWise;

@property (nonatomic, assign) float precent;
@property (readonly, nonatomic, strong) UILabel *precentLabel;

/**
 *  设置进度
 *
 *  @param precent  进度
 *  @param duration 动画时间
 */
- (void)setPrecent:(CGFloat)precent withAnimationDuration:(CGFloat)duration;

@end
