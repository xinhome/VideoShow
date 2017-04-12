//
//  VideoTabBarController.m
//  Video
//
//  Created by iking on 2017/3/21.
//  Copyright © 2017年 iking. All rights reserved.
//

#import "VideoTabBarController.h"
#import "HomepageViewController.h"
#import "MainViewController.h"
#import "MyTabBar.h"

@interface VideoTabBarController ()

@end

@implementation VideoTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setValue:[MyTabBar new] forKey:@"tabBar"];
    self.tabBar.tintColor = [UIColor whiteColor];
    
    [self addViewControllerClass:[HomepageViewController class] title:@"主页" imageName:nil selectImage:nil];
    [self addViewControllerClass:[MainViewController class] title:@"我的" imageName:nil selectImage:nil];
    
}

#pragma mark - 添加控制器
- (void)addViewControllerClass:(Class)class title:(NSString *)title imageName:(NSString *)imageName selectImage:(NSString *)selectImage
{
    // 创建一个控制器
    UIViewController *viewC = [[class alloc] init];
    // 设置标题图片 点击图片
    viewC.tabBarItem.image = [UIImage imageNamed:imageName];
    viewC.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    // 添加到数组中
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:viewC];
    viewC.navigationItem.title = title;
    navVC.tabBarItem.title = title;
    
    // 设置导航栏透明
    [navVC.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 去除导航栏下方的横线
    navVC.navigationBar.shadowImage = [[UIImage alloc] init];
    [self addChildViewController:navVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
