//
//  FYEmptyView.h
//  emptyView
//
//  Created by wang on 2018/7/31.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^emptyClickBlock)(void);
@interface FYEmptyView : UIView
@property(nonatomic,strong)  UIImageView *imageView;
@property(nonatomic,copy) UILabel* titleLabel;
@property(nonatomic,copy) emptyClickBlock emptyClickBlock;

/**
 显示空白页
 @param tips 显示的文字内容,默认为没有数据
 @param view 在哪里显示空白数据
 @param imageName 图片名称
 @param complete 点击图片的回调
 */
+(void)showEmptyWith:(NSString *)tips inView:(UIView *)view imageName:(NSString *)imageName completc:(emptyClickBlock)complete;

/**
  显示空白页
 @param view 在哪里显示空白数据
 @param complete 点击图片的回调
 */
+(void)showInView:(UIView *)view completc:(emptyClickBlock)complete;

/**
 移除空白页
 @param view 在哪里显示空白数据
 */
+(void)dissmissInView:(UIView *)view isHasData:(BOOL)isHasData;

@end
