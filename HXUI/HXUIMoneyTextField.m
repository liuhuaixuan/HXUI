//
//  HXUIMoneyTextField.m
//  TestDemo
//
//  Created by SS001 on 2021/4/27.
//

#import "HXUIMoneyTextField.h"

@interface HXUIMoneyTextField ()<QMUITextFieldDelegate>

@end

@implementation HXUIMoneyTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupView];
}

- (void)setupView
{
    if (!self.maxValue) {
        self.maxValue = CGFLOAT_MAX;
    }
    if (!self.decimalDigits) {
        self.decimalDigits = 2;
    }
    
    self.delegate = self;
    self.keyboardType = UIKeyboardTypeDecimalPad;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //限制只能输入数字
    BOOL isHaveDian = YES;
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDian = NO;
    }
    if ([string length] > 0) {
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.') {
            //数据格式正确
            if([textField.text length] == 0){
                if(single == '.') {
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            //输入的字符是否是小数点
            if (single == '.') {
                if(!isHaveDian) {
                    //text中还没有小数点
                    return YES;
                }else{
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                //存在小数点
                if (isHaveDian) {
                    //判断小数点的位数
                    NSRange ran = [textField.text rangeOfString:@"."];
                    if (range.location - ran.location <= self.decimalDigits) {
                        NSString *text = [textField.text stringByAppendingString:string];
                        // 判断数字是否过大
                        if (text.floatValue > self.maxValue) {
                            return NO;
                        }
                        return YES;
                    }else{
                        return NO;
                    }
                }else{
                    // 判断数字是否过大
                    NSString *text = [textField.text stringByAppendingString:string];
                    if (text.floatValue > self.maxValue) {
                        return NO;
                    }
                    return YES;
                }
            }
        }else{
            //输入的数据格式不正确
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    return YES;
}

@end
