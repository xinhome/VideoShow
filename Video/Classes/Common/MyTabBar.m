//
//  MyTabBar.m
//  Video
//
//  Created by iking on 2017/3/21.
//  Copyright © 2017年 iking. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar ()

@property (nonatomic, strong) UIButton *videoPlayBtn;

@end

@implementation MyTabBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.videoPlayBtn = [[UIButton alloc] init];
        [self.videoPlayBtn setImage:nil forState:UIControlStateNormal];
        [self.videoPlayBtn setTitle:@"录制" forState:(UIControlStateNormal)];
        [self.videoPlayBtn setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
        
        WeakSelf
        [self.videoPlayBtn addActionHandler:^(NSInteger tag) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidClickVideoButton:)]) {
                [weakSelf.delegate tabBarDidClickVideoButton:weakSelf];
            }
        }];
        self.tintColor = [UIColor orangeColor];
        [self addSubview:self.videoPlayBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    int index = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.width/(self.items.count+1);
    CGFloat h = self.height;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            if (index == 1) {
                index = 2;
            }
            x = index * w;
            child.frame = CGRectMake(x, y, w, h);
            index ++;
        }
    }
    self.videoPlayBtn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-3);
    self.videoPlayBtn.bounds = CGRectMake(0, 0, 60, 56);
}


@end
