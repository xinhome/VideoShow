//
//  Global.h
//  haipai
//
//  Created by Tom Yin on 2016/12/12.
//  Copyright © 2016年 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject

+ (BOOL)isAllowedNotification;

+ (NSString *)timeTransform:(NSTimeInterval)timeInterval;

+ (NSString *)pathForAlbum:(NSString *)albumName;

@end

@interface NSString (Category)

- (NSString *)transform;

+ (NSString *)fileSizeWithInterge:(NSInteger)size;

- (CGSize)getSizeWithMaxSize:(CGSize)maxSize attributes:(NSDictionary *)attributes;

@end

@interface UIImage (Category)

+ (instancetype)createImageWithColor:(UIColor *)color;

- (instancetype)imageCompressToSize:(CGSize)size;

/** 将图片旋转弧度radians */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

@end
