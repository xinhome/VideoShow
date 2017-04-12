//
//  MainViewController.m
//  Video
//
//  Created by iking on 2017/3/21.
//  Copyright © 2017年 iking. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorDefaultBackground;
    self.navigationController.navigationBar.tintColor = mainNavigationBarColor;
    self.navigationItem.title = @"我的";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
