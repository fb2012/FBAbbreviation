//
//  UILabel+FBAbbreviation.h
//  GCDDeno
// 对最后一行尾部进行截取 显示...
//  Created by FBI on 17/4/28.
//  Copyright © 2017年 fengbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FBAbbreviation)
/**
 最后一行显示字符
 
 @param distance 与右侧的距离
 @param str 最后显示的字符
 */
-(void)setLineReakByTruncatingLastDistance:(float)distance andString:(NSString *)str;

@end
