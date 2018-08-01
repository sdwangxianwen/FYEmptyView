//
//  FYEmptyView.m
//  emptyView
//
//  Created by wang on 2018/7/31.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FYEmptyView.h"


@implementation FYEmptyView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //默认图片
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.imageView.center =  CGPointMake(self.center.x, self.center.y - 50);
        [self addSubview:self.imageView];
        self.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emptyImageClick:)];
        [self.imageView addGestureRecognizer:tap];
        //文字
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 20, self.frame.size.width, 20)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
    }
    return self;
}

-(void)emptyImageClick:(UITapGestureRecognizer *)tap {
    if (self.emptyClickBlock) {
        self.emptyClickBlock();
    }
}

+(void)showEmptyWith:(NSString *)tips inView:(UIView *)view imageName:(NSString *)imageName completc:(emptyClickBlock)complete {
    if (!imageName) {
        imageName = @"quit";
    }
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    FYEmptyView *emptyView = [[FYEmptyView alloc] initWithFrame:view.frame];
    emptyView.imageView.image = [UIImage imageNamed:imageName];
    emptyView.titleLabel.text = tips;
    emptyView.emptyClickBlock = ^{
        complete();
    };
    [view addSubview:emptyView];
   
}
+(void)showInView:(UIView *)view completc:(emptyClickBlock)complete{
    [self showEmptyWith:nil inView:view imageName:nil completc:complete];
}


+(void)dissmissInView:(UIView *)view {
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    FYEmptyView *emptyView = [self EmptyForView:view];
    [emptyView removeFromSuperview];
}

+ (FYEmptyView *)EmptyForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            FYEmptyView *emotyView = (FYEmptyView *)subview;
            return emotyView;
        }
    }
    return nil;
}

-(void)dealloc {
    
}

@end