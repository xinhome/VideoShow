//
//  BasicViewController.h
//  haipai
//
//  Created by Tom Yin on 2016/12/8.
//  Copyright © 2016年 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 基类控制器
@interface BasicViewController : UIViewController

@property (nonatomic) CGFloat keyboardHeight;

@property (nonatomic, assign) NSTimeInterval keyboardDuration;

- (void)pushViewController:(UIViewController *)vc animation:(BOOL)animation;
- (void)popViewController;
- (void)popToRootViewController;

@end

@interface UIViewController (basicViewController)

- (void)addBack;
- (void)addBackToRootViewController;
- (void)addRightItemWithTitle:(NSString *)title action:(SEL)action;
- (void)addRightItemWithImage:(NSString *)imageName action:(SEL)action;
- (void)addLeftItemWithImage:(NSString *)imageName action:(SEL)action;
- (void)showHUDInView:(UIView *)view;
@end
