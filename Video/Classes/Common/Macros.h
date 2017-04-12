//
//  Macros.h
//  haipai
//
//  Created by Tom Yin on 2016/12/8.
//  Copyright © 2016年 YJ. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

// 颜色(RGB)
#define UIColorWithRGB(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define UIColorWithRGBA(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UIColorFromRGB(rgb) [UIColor colorWithRed:(((rgb & 0xFF0000) >> 16))/255.0 green:(((rgb &0xFF00) >>8))/255.0 blue:((rgb &0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBF(rgb, a) [UIColor colorWithRed:(((rgb & 0xFF0000) >> 16))/255.0 green:(((rgb &0xFF00) >>8))/255.0 blue:((rgb &0xFF))/255.0 alpha:a]
#define UIColorWhite [UIColor whiteColor]
#define UIColorBlack [UIColor blackColor]
#define kTextColor UIColorWithRGB(224, 224, 224) // 登录注册textField
#define kClearColor [UIColor clearColor]
#define kOrangeColor UIColorWithRGB(237, 167, 106) // 主题颜色

#define UIColorDefaultBackground UIColorWithRGB(248, 246, 244)
#define GlobalColor UIColorWithRGB(247, 102, 168)
#define UINavigationBarColor UIColorWithRGB(246, 55, 127)

#define mainNavigationBarColor UIColorWithRGB(83, 83, 83)

// 宽、高
#define rateWidth(width) width/375.0*ScreenWidth
#define rateHeight(height) height/667.0*ScreenHeight
#define rateFontSize(a) ScreenWidth<375? (a*(ScreenWidth/375.0f)):a

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// 系统版本
#define IOS10 [[[UIDevice currentDevice] systemVersion] floatValue] > 10.0
#define IOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]

// 屏幕尺寸
#define INCH_4 [UIScreen mainScreen].bounds.size.height == 568.0
#define INCH_4_7 [UIScreen mainScreen].bounds.size.height == 667.0
#define INCH_5_5 [UIScreen mainScreen].bounds.size.height == 736.0
#define kScreenRatio ScreenWidth / ScreenHeight

// 字体
#define UIFontYP(fontSize) [UIFont YPFontWithSize:fontSize]
#define UIFontSystem(fontSize) [UIFont systemFontOfSize:fontSize]

// 若引用
#define WeakSelf __weak typeof(self) weakSelf = self;
#define WeakAlert __weak typeof(alertView) weakAlert = alertView;

//////
#define UserDefaults [NSUserDefaults standardUserDefaults]

// 图片
#define UIImageNamed(name) [UIImage imageNamed:name]
#define UIImageWithColor(color) [UIImage createImageWithColor:color]
// Block
typedef void(^MYActionArgu)(id arguments);
typedef void(^MYAction)();

#endif /* Macros_h */
