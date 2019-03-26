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
@property (nonatomic, strong)UIButton *emptyBtn;
@property(nonatomic,copy) emptyClickBlock emptyClickBlock;

+(FYEmptyView *)initEmptyViewWithTitle:(NSString *)title imageName:(NSString *)imageName bounds:(CGRect)bounds backgroundColor:(UIColor *)backgroundColor;

@end
