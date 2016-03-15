//
//  ProgressHud.m
//  Tool
//
//  Created by LSH on 16/1/12.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import "ProgressHud.h"

@interface ProgressHud()


@property (nonatomic, strong)UILabel *numLabel;////显示已完成百分比的数值

@property (nonatomic, strong)UIColor *color1;////圆环背景色
@property (nonatomic, strong)UIColor *color2;////已走进程背景色
@property (nonatomic, assign)CGFloat lineWidth;///线宽
@property (nonatomic, assign)CGFloat value;////设置已完成的百分比

@end
@implementation ProgressHud

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.lineWidth, self.lineWidth, self.frame.size.width-2*self.lineWidth, self.frame.size.width-2*self.lineWidth)];
        _numLabel.layer.cornerRadius = _numLabel.frame.size.width/2.0;
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.layer.masksToBounds = YES;
        [self addSubview:_numLabel];
    }
    return _numLabel;
}

- (void)setHaveNotHudBackColor:(UIColor*)color1 andHaveDidBackColor:(UIColor *)color2 withLineWidth:(CGFloat)lineWidth andTitleFont:(UIFont *)font andTitleColor:(UIColor *)titleColor
{
    self.color1 = color1;
    self.color2 = color2;
    self.lineWidth = lineWidth;
    self.numLabel.font = font;
    self.numLabel.textColor = titleColor;
    [self setNeedsDisplay];
}

-(void)setProgressHudValue:(CGFloat)value
{
    self.value = value;
    self.numLabel.text = [NSString stringWithFormat:@"%.2f%%",value*100];
}

-(void)setProgressHudValue:(CGFloat)value withpointLength:(NSInteger)len
{
    self.value = value;
    NSString *num = [NSString stringWithFormat:@"%f",value*100];
    NSString *subNum = [num substringToIndex:len+3];
    self.numLabel.text = [NSString stringWithFormat:@"%@%%",subNum];
}
- (void)drawRect:(CGRect)rect
{
    ///把自定义视图上面的绘制线全部填充覆盖掉
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 0, 0));////作用范围
    [super drawRect:rect];

    [self.color1 set];
    CGFloat r = self.frame.size.width/2.0;
    CGPoint centerPoint = CGPointMake(r, r);
    UIBezierPath* huXian = [UIBezierPath bezierPathWithArcCenter:centerPoint///中心点
                                                          radius:r-self.lineWidth///半径
                                                      startAngle:0///开始角度
                                                        endAngle:M_PI*2////结束角度
                                                       clockwise:YES];
    huXian.lineWidth = self.lineWidth;
    huXian.lineCapStyle = kCGLineCapRound; //线条拐角
    huXian.lineJoinStyle = kCGLineCapRound; //终点处理
    [huXian stroke];
    
    [self.color2 set];
    UIBezierPath *huan0 = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                         radius:r-self.lineWidth
                                                     startAngle:-M_PI/2.0
                                                       endAngle:M_PI*2*(self.value-0.25)
                                                      clockwise:YES];
    huan0.lineWidth = self.lineWidth;
    huan0.lineCapStyle = kCGLineCapRound; //线条拐角
    huan0.lineJoinStyle = kCGLineCapRound; //终点处理
    [huan0 stroke];

}


@end
