//
//  UIView+customerView.m
//  haipai
//
//  Created by Tom Yin on 2016/12/9.
//  Copyright © 2016年 YJ. All rights reserved.
//

#import "UIView+customerView.h"
#import <objc/runtime.h>

static const void *jk_UIButtonBlockKey = &jk_UIButtonBlockKey;

@implementation UIView (customerView)

@end

@implementation UIFont (custom)

+ (UIFont *)YPFontWithSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Yuppy SC" size:fontSize];
}

@end

@implementation UILabel (customerView)

+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize {
    UILabel *lbl = [[self alloc] init];
    lbl.textColor = textColor;
    lbl.text = text;
    lbl.font = [UIFont systemFontOfSize:fontSize];
    if (IOS10) {
        lbl.adjustsFontForContentSizeCategory = YES;
    }
    return lbl;
}

@end

@implementation UIButton (customerView)

+ (UIButton *)buttonWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                   titleColor:(UIColor *)titleColor
                   background:(UIColor *)background
                 cornerRadius:(CGFloat)cornerRadius {
    UIButton *btn = [self buttonWithType:UIButtonTypeCustom];
//    btn.titleLabel.numberOfLines = 0;
    [btn sizeToFit];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage createImageWithColor:background] forState:UIControlStateNormal];
    [btn.layer setCornerRadius:cornerRadius];
    [btn.layer setMasksToBounds:YES];
    return btn;
}

- (void)addActionHandler:(TouchedButtonBlock)block {
    objc_setAssociatedObject(self, jk_UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)blockActionTouched:(UIButton *)btn{
    TouchedButtonBlock block = objc_getAssociatedObject(self, jk_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

@end

@implementation UIBarButtonItem (customerView)

+ (UIBarButtonItem *)barButtonBack:(id)target imageName:(NSString *)imageName action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor redColor];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 5, 25, 25)];
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, 0, 0)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

+ (UIBarButtonItem *)barButtonLeft:(id)target imageName:(NSString *)imageName acton:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 5, 25, 25)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

+ (UIBarButtonItem *)barButtonRight:(id)target title:(NSString *)title action:(SEL)action {
    UIButton *btn = [UIButton buttonWithTitle:title fontSize:18 titleColor:UIColorWhite background:[UIColor clearColor] cornerRadius:0];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 0, 40, 25)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image highlightImage:(UIImage *)highlightImage
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    [btn setBackgroundImage:image forState:(UIControlStateNormal)];
    [btn setBackgroundImage:highlightImage forState:(UIControlStateHighlighted)];
    // view的size不能直接设置，通过给UIView添加扩展获得
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end

@implementation UITextField (customerView)

+ (UITextField *)textFieldLoginWithPlaceholder:(NSString *)placeholder {
    UITextField *textField = [[UITextField alloc] init];
    textField.returnKeyType = UIReturnKeyDone;
//    textField.font = [UIFont systemFontOfSize:14];
    textField.borderStyle = UITextBorderStyleNone;
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    textField.placeholder = placeholder;
//    UIView *topLine = [UIView new];
//    topLine.backgroundColor = UIColorWithRGB(195, 184, 184);
//    [textField addSubview:topLine];
//    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(@0);
//        make.height.equalTo(@1);
//    }];
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = UIColorWithRGB(195, 184, 184);
    [textField addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(textField);
        make.left.equalTo(@2);
        make.right.equalTo(@(-2));
        make.height.equalTo(@1);
    }];
    return textField;
}
+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize {
    UITextField *textField = [[UITextField alloc] init];
    textField.returnKeyType = UIReturnKeyDone;
    textField.backgroundColor = UIColorWhite;
    textField.font = UIFontYP(fontSize);
    if (placeholder == nil) {
        placeholder = @"";
    }
    
//    UIView *leftView = [UIView new];
//    leftView.backgroundColor = UIColorWhite;
//    leftView.frame = CGRectMake(0, 0, 15, 40);
//    textField.leftView = leftView;
//    textField.leftViewMode = UITextFieldViewModeAlways;
    
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSFontAttributeName: UIFontYP(14)}];
//    textField.attributedPlaceholder = attrStr;
    textField.placeholder = placeholder;
    return textField;
}

@end

@implementation UIImage (customerView)

- (UIImage *)clipImageInRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}

@end
