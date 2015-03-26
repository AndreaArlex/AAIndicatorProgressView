//
//  AAIndicatorProgressView.m
//  AAIndicatorProgressDemo
//
//  Created by Arlexovincy on 15/3/26.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#import "AAIndicatorProgressView.h"

@implementation AAIndicatorProgressView

- (id)initWithFrame:(CGRect)frame backColor:(UIColor*)backColor progressColor:(UIColor*)progressColor lineWidth:(float)lineWidth isClockWise:(BOOL)isClockWise{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        mbackColor = backColor;
        mprogressColor = progressColor;
        mlineWidth = lineWidth;
        misClockWise = isClockWise;
        
        [self initView];
    }
    
    return self;

}

- (void)initView{

    self.backgroundColor = [UIColor clearColor];
    
    _precentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) - mlineWidth *2, CGRectGetHeight(self.frame) - mlineWidth *2)];
    _precentLabel.center = self.center;
    _precentLabel.textAlignment = NSTextAlignmentCenter;
    _precentLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_precentLabel];
    
    backLayer = [CAShapeLayer layer];
    progressLayer = [CAShapeLayer layer];
    
    UIBezierPath *backPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2.0f, CGRectGetHeight(self.frame)/2.0f) radius:(CGRectGetHeight(self.frame) /2.0f) - mlineWidth/2.0f startAngle:DEGREES_TO_RADIANS(0.0f) endAngle:DEGREES_TO_RADIANS(360.0f) clockwise:misClockWise];
    backLayer.lineCap = kCALineCapRound;
    backLayer.fillColor = [UIColor clearColor].CGColor;
    backLayer.strokeColor = mbackColor.CGColor;
    backLayer.lineWidth = mlineWidth;
    backLayer.zPosition = 1;
    backLayer.path = backPath.CGPath;
    [self.layer addSublayer:backLayer];
    [self.layer addSublayer:progressLayer];
    
    
}

- (void)setPrecent:(float)precent{

    _precent = precent;
    
    float endAngle = misClockWise ? (-90 + _precent * 360) : (-90 - precent*360);
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2.0f, CGRectGetHeight(self.frame)/2.0f) radius:(CGRectGetHeight(self.frame) /2.0f) - mlineWidth/2.0f startAngle:DEGREES_TO_RADIANS(-90.0f) endAngle:DEGREES_TO_RADIANS(endAngle) clockwise:misClockWise];
    progressLayer.lineCap = kCALineCapRound;
    progressLayer.fillColor = [UIColor clearColor].CGColor;
    progressLayer.strokeColor = [UIColor redColor].CGColor;
    progressLayer.lineWidth = mlineWidth;
    progressLayer.zPosition = 1;
    progressLayer.path = progressPath.CGPath;

}

- (void)setPrecent:(CGFloat)precent withAnimationDuration:(CGFloat)duration{

    _precent = precent;
    
    float endAngle = misClockWise ? (-90 + _precent * 360) : (-90 - precent*360);
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2.0f, CGRectGetHeight(self.frame)/2.0f) radius:(CGRectGetHeight(self.frame) /2.0f) - mlineWidth/2.0f startAngle:DEGREES_TO_RADIANS(-90.0f) endAngle:DEGREES_TO_RADIANS(endAngle) clockwise:misClockWise];
    progressLayer.lineCap = kCALineCapRound;
    progressLayer.fillColor = [UIColor clearColor].CGColor;
    progressLayer.strokeColor = [UIColor redColor].CGColor;
    progressLayer.lineWidth = mlineWidth;
    progressLayer.zPosition = 1;
    progressLayer.path = progressPath.CGPath;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = @0.0f;
    pathAnimation.toValue = @(precent);
    [progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    progressLayer.strokeEnd   = precent;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
