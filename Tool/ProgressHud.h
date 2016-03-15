//
//  ProgressHud.h
//  Tool
//
//  Created by LSH on 16/1/12.
//  Copyright © 2016年 Practice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressHud : UIView

/*
 * 参数说明 color1 是圆环的背景色    color2是圆环已完成进程的颜色   linewidth 圆环线宽度
 *  titleFont 圆环里面的文字字号    titleColor 文字颜色
 */

- (void)setHaveNotHudBackColor:(UIColor*)color1 andHaveDidBackColor:(UIColor *)color2 withLineWidth:(CGFloat)lineWidth andTitleFont:(UIFont *)font andTitleColor:(UIColor *)titleColor;


/*
 * 改变圆环进度的时候调用此方法 默认保留两位小数
 * 参数 value 是小数  如果传0.98   里面显示98.00%   
 * 参数 len 小数点后保留长度            注意:如果字体太大自行调节到合适为止
 */

-(void)setProgressHudValue:(CGFloat)value;
-(void)setProgressHudValue:(CGFloat)value withpointLength:(NSInteger)len;

@end
