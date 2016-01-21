//
//  YunisTopShowHUD.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/19.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,YunisTopHUDShowType) {
    YunisTopHUDShowWithBlurLayer,
    YunisTopHUDShowWithCleanLayer,
};

typedef NS_ENUM(NSInteger,YunisTopShowHUDAnimationType) {
    YunisTopShowHUDAnimationType_Top,
    YunisTopShowHUDAnimationType_Center,
};
typedef NS_ENUM(NSInteger,YunisTopHUDShowState) {
    YunisTopHUDShowState_showing,
    YunisTopHUDShowState_alerdayShow,
};
@interface YunisTopShowHUD : UIView
- (void)show;
- (void)diss;
+ (instancetype)showWithType:(YunisTopHUDShowType)type AnimationType:(YunisTopShowHUDAnimationType)AnimationType;
@property(nonatomic)YunisTopShowHUDAnimationType m_type;

@end
