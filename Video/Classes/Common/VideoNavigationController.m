//
//  VideoNavigationController.m
//  Video
//
//  Created by iking on 2017/4/12.
//  Copyright © 2017年 iking. All rights reserved.
//

#import "VideoNavigationController.h"

@interface VideoNavigationController ()

@end

@implementation VideoNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// 第一次调用类的时候会调用一次该方法
+ (void)initialize
{
    // 设置UINavigationBar的主题
    [self setUpNavigationBarTheme];
}
#pragma mark - 设置UINavigationBar的主题
+ (void)setUpNavigationBarTheme
{
    // 通过设置appearance对象，能够修改整个项目中所有UINavigationBar的样式
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    // 设置字体颜色大小
    textAttrs[NSForegroundColorAttributeName] = kOrangeColor;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    // 设置字体的偏移量（0）
    // 说明：UIOffsetZero是结构体，只有包装成NSValue对象才能放进字典中
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [appearance setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    // 显示导航栏
    viewController.navigationController.navigationBarHidden = NO;
    if (!viewController.tabBarController.tabBar.hidden) {
        // 隐藏tabbar
        viewController.tabBarController.tabBar.hidden = YES;
    }
    // 可以在这里统一设置返回按钮
    if (self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:[UIImage imageNamed:@"back"] highlightImage:nil];
    }
    //开启iOS7的滑动返回效果
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}
//- (UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    UIViewController *viewController = [super popViewControllerAnimated:animated];
//    if (self.viewControllers.count == 1) {
//        // 显示首页tabbar
//        [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if ([obj isKindOfClass:NSClassFromString(@"HomepageViewController")] || [obj isKindOfClass:NSClassFromString(@"ShopViewController")] || [obj isKindOfClass:NSClassFromString(@"AddressbookViewController")] || [obj isKindOfClass:NSClassFromString(@"MainViewController")]) {
//                viewController.tabBarController.tabBar.hidden = NO;
//                *stop = YES;
//            }
//        }];
//    } else {
//        // 非首页tabbar隐藏
//        viewController.tabBarController.tabBar.hidden = YES;
//    }
//    return viewController;
//}


@end
