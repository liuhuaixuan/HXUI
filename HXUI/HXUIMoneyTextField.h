//
//  HXUIMoneyTextField.h
//  TestDemo
//
//  Created by SS001 on 2021/4/27.
//

#import <QMUIKit/QMUIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXUIMoneyTextField : QMUITextField

// 最大值 默认无限大
@property(nonatomic, assign) IBInspectable CGFloat maxValue;
// 小数位数,默认2位
@property(nonatomic, assign) IBInspectable NSInteger decimalDigits;

@end

NS_ASSUME_NONNULL_END
