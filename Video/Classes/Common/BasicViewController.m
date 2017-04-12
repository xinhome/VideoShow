//
//  BasicViewController.m
//  haipai
//
//  Created by Tom Yin on 2016/12/8.
//  Copyright © 2016年 YJ. All rights reserved.
//

#import "BasicViewController.h"
#import "AppDelegate.h"
//#import "UINavigationController+FDFullscreenPopGesture.h"
#import <objc/runtime.h>

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)keyboardWillShow:(NSNotification *)notication {
    NSDictionary *info = [notication userInfo];
    NSValue *value = [info valueForKey:UIKeyboardFrameEndUserInfoKey];
    self.keyboardDuration = [[info valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGSize keyboardSize = [value CGRectValue].size;
    self.keyboardHeight = keyboardSize.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorDefaultBackground;
}

- (instancetype)init{
    self = [super init];
    if (self) {
//        Class Home = NSClassFromString(@"HomeViewController");
//        Class BBS  = NSClassFromString(@"BBSViewController");
//        Class Order = NSClassFromString(@"OrderViewController");
//        Class User = NSClassFromString(@"UserViewController");
//        if ([self isKindOfClass:[Home class]] || [self isKindOfClass:[BBS class]]||[self isKindOfClass:[Order class]]||[self isKindOfClass:[User class]]) {
//            self.hidesBottomBarWhenPushed = NO;
//        }else{
//            self.hidesBottomBarWhenPushed = YES;
//        }
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pushViewController:(UIViewController *)vc animation:(BOOL)animation {
    [self.navigationController pushViewController:vc animated:animation];
}

- (void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

@implementation UIViewController (basicViewController)

char HTTPRequest = '0';

- (void)addBack {
    UIBarButtonItem *backItem = [UIBarButtonItem barButtonBack:self imageName:@"back" action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backItem;
}
- (void)addBackToRootViewController {
    UIBarButtonItem *backItem = [UIBarButtonItem barButtonBack:self imageName:@"back" action:@selector(backToRootViewController)];
    self.navigationItem.leftBarButtonItem = backItem;
}
- (void)addLeftItemWithImage:(NSString *)imageName action:(SEL)action {
    UIBarButtonItem *leftItem = [UIBarButtonItem barButtonLeft:self imageName:imageName acton:action];
    self.navigationItem.leftBarButtonItem = leftItem;
}
- (void)addRightItemWithImage:(NSString *)imageName action:(SEL)action {
    UIBarButtonItem *item = [UIBarButtonItem barButtonLeft:self imageName:imageName acton:action];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)addRightItemWithTitle:(NSString *)title action:(SEL)action{
    UIBarButtonItem *rightItem = [UIBarButtonItem barButtonRight:self title:title action:action];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backToRootViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)setHUD:(UIView *)HUD {
    objc_setAssociatedObject(self, &HTTPRequest, HUD, OBJC_ASSOCIATION_RETAIN);
}
- (void)showHUDInView:(UIView *)view {
    [self setHUD:[[UIView alloc] init]];
}

@end
