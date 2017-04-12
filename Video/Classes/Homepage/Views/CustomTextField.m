//
//  CustomTextField.m
//  Power-Maintenance
//
//  Created by qihwatech on 16/6/28.
//  Copyright © 2016年 qihwatech. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textColor = kTextColor;
        self.font = [UIFont systemFontOfSize:12];
        self.layer.borderColor = kTextColor.CGColor;
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        // 光标颜色
        [[UITextField appearance] setTintColor:kTextColor];
    }
    return self;
}
//控制placeHolder的位置，左右缩20
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x+rateWidth(40), bounds.origin.y, bounds.size.width, bounds.size.height);//更好理解些
    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    //return CGRectInset(bounds, 50, 0);
    CGRect inset = CGRectMake(bounds.origin.x+rateWidth(40), bounds.origin.y, bounds.size.width, bounds.size.height);//更好理解些
    
    return inset;
    
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    //return CGRectInset( bounds, 10 , 0 );
    
    CGRect inset = CGRectMake(bounds.origin.x +rateWidth(40), bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}

@end
