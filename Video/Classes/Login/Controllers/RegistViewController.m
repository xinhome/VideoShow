//
//  RegistViewController.m
//  Video
//
//  Created by iking on 2017/4/12.
//  Copyright © 2017年 iking. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) CustomTextField *phoneNumTF; // 手机号
@property (nonatomic, strong) CustomTextField *passwordTF; // 密码

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    self.view.backgroundColor = UIColorDefaultBackground;
    [self setUpUI];
}
- (void)setUpUI
{
    // 手机号
    self.phoneNumTF = [CustomTextField new];
    _phoneNumTF.delegate = self;
    // 占位符字体设置
    _phoneNumTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入手机号" attributes:@{NSForegroundColorAttributeName:kTextColor, NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    [self.view addSubview:_phoneNumTF];
    [_phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(rateHeight(95)+64);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(rateWidth(345), rateHeight(43)));
    }];
    
    // 密码
    self.passwordTF = [CustomTextField new];
    // 占位符字体设置
    _passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入密码" attributes:@{NSForegroundColorAttributeName:kTextColor, NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    //    _passwordTF.secureTextEntry = YES;
    [self.view addSubview:_passwordTF];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneNumTF.mas_bottom).with.offset(rateHeight(20));
        make.centerX.equalTo(self.view);
        make.size.equalTo(_phoneNumTF);
    }];
    
    // 忘记密码
    UIButton *forgetPasswordBtn = [UIButton buttonWithTitle:@"忘记密码？" fontSize:14 titleColor:UIColorWithRGB(60, 54, 30) background:kClearColor cornerRadius:0];
    [forgetPasswordBtn sizeToFit];
    [self.view addSubview:forgetPasswordBtn];
    [forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTF.mas_bottom).offset(rateHeight(28));
        make.right.equalTo(_passwordTF);
    }];
    UIView *line = [UIView new];
    line.backgroundColor = UIColorWithRGB(60, 54, 30);
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(forgetPasswordBtn);
        make.right.equalTo(forgetPasswordBtn);
        make.top.equalTo(forgetPasswordBtn.mas_bottom).offset(5);
        make.height.equalTo(@(1));
    }];
    
    // 注册
    UIButton *btn1 = [UIButton buttonWithTitle:@"注册" fontSize:18 titleColor:[UIColor whiteColor] background:kOrangeColor cornerRadius:5];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(rateWidth(15));
        make.size.mas_offset(CGSizeMake(rateWidth(160), rateHeight(44)));
        make.top.equalTo(_passwordTF.mas_bottom).offset(rateHeight(90));
    }];
    // 登录
    UIButton *btn2 = [UIButton buttonWithTitle:@"登录" fontSize:18 titleColor:[UIColor whiteColor] background:kOrangeColor cornerRadius:5];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-rateWidth(15));
        make.size.mas_offset(CGSizeMake(rateWidth(160), rateHeight(44)));
        make.top.equalTo(_passwordTF.mas_bottom).offset(rateHeight(90));
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
