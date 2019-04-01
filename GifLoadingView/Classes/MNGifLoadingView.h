//
//  MNGifLoadingView.h
//  GifLoadingView
//
//  Created by AQ on 2019/3/31.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNGifLoadingView : NSObject

/**
 显示加载图片
 
 @param imageName 图片名称
 */
+ (void)startLoadingWithGifImageName:(NSString *)imageName;

/**
 开始加载
 
 @param imageName 图片名称
 @param type 背景模式
 */
+ (void)startLoadingWithGifImageName:(NSString *)imageName andType:(SVProgressHUDMaskType)type;
/**
 结束加载
 */
+ (void)endLoading;

@end

NS_ASSUME_NONNULL_END
