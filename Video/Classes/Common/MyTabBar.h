//
//  MyTabBar.h
//  Video
//
//  Created by iking on 2017/3/21.
//  Copyright © 2017年 iking. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;

@protocol MyTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickVideoButton:(MyTabBar *)myTabBar;

@end

@interface MyTabBar : UITabBar

@property (nonatomic, weak) id<MyTabBarDelegate>delegate;

@end
