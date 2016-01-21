//
//  YunisTopShowHUD.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/19.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisTopShowHUD.h"
#import "UIImage+ImageEffects.h"
#import "UIView+snapshot.h"
#import "YunisAlertTitleView.h"
@interface YunisTopShowHUD()
{
    YunisAlertTitleView *topView;
    UIImageView *bgImageView;
    float topContranst;
}
@property(nonatomic)YunisTopHUDShowState showState;
@end

static const float topViewHeigth = 188;
@implementation YunisTopShowHUD

#pragma mark - Life Cycle

+ (instancetype)showWithType:(YunisTopHUDShowType)type AnimationType:(YunisTopShowHUDAnimationType)AnimationType
{
    YunisTopShowHUD *hud = [[YunisTopShowHUD alloc] init];
    hud.m_type = AnimationType;
    switch (type) {
        case YunisTopHUDShowWithBlurLayer: {
            [hud addBgView];
            break;
        }
        case YunisTopHUDShowWithCleanLayer: {
            
            break;
        }
        default: {
            break;
        }
    }
    
    return hud;
}

- (instancetype)init
{
    CGRect t = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:t];
    if (self) {


        topContranst = - topViewHeigth;
        topView = [[YunisAlertTitleView alloc] initWithFrame:CGRectMake(0, - topViewHeigth, self.frame.size.width,topViewHeigth)];
        topView.backgroundColor = [UIColor purpleColor];
        
        [self addSubview:topView];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diss)];
        [self addGestureRecognizer:tap];
        
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)updateConstraints
{
    [super updateConstraints];
    [topView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).offset(- 80);
        make.centerX.equalTo(self);
        make.height.equalTo(topViewHeigth);
        make.top.equalTo(topContranst);
    }];
}
- (void)dealloc
{
    NSLog(@"%@  dealloc",[self class]);
}

#pragma mark - Public Method
//外部方法
- (void)addBgView
{
    UIImage *s =  [[UIApplication sharedApplication].keyWindow snapshotImage];
    bgImageView = [[UIImageView alloc] initWithImage:[s applyDarkEffect]];
    bgImageView.alpha = 0;

    [self insertSubview:bgImageView belowSubview:topView];
}
- (void)show{

    self.showState = YunisTopHUDShowState_showing;
    [[UIApplication sharedApplication].keyWindow addSubview:self];

    float duration ;
    switch (self.m_type) {
        case YunisTopShowHUDAnimationType_Top: {
            topContranst = 0.f;
            duration = .8;
            break;
        }
        case YunisTopShowHUDAnimationType_Center: {
            topContranst = (self.frame.size.height - topViewHeigth)/2.f;
            duration = 1;
            break;
        }
        default: {
            break;
        }
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:.3 animations:^{
        bgImageView.alpha =1;
    }];
    
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:.7
          initialSpringVelocity:1
                        options:UIViewAnimationOptionTransitionCurlDown
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         if (finished) {
                             self.showState = YunisTopHUDShowState_alerdayShow;

                         }
                     }];
    
    
    
//    UIInterpolatingMotionEffect * xEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    xEffect.minimumRelativeValue =  [NSNumber numberWithFloat:-40.0];
//    xEffect.maximumRelativeValue = [NSNumber numberWithFloat:40.0];
//    [targetView addMotionEffect:xEffect];
}
- (void)diss{
    
    if (self.showState == YunisTopHUDShowState_showing) {
        NSLog(@"正在动画 不接受点击时间");
        return;
    }

    [UIView animateWithDuration:.3 animations:^{
        bgImageView.alpha =0;
    }];
   

    
    switch (self.m_type) {
        case YunisTopShowHUDAnimationType_Top: {
            topContranst = -topViewHeigth;;
            [self setNeedsUpdateConstraints];
            [self updateConstraintsIfNeeded];
            [UIView animateWithDuration:.5 animations:^{
                [self layoutIfNeeded];
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [self removeFromSuperview];
                }
            }];
            break;
        }
        case YunisTopShowHUDAnimationType_Center: {
//            // 平移动画
            
            CABasicAnimation *a = [CABasicAnimation animation];
            a.keyPath = @"transform.translation.y";
            a.toValue = @(self.Y_Bottom);
            
            CABasicAnimation *b = [CABasicAnimation animation];
            b.keyPath = @"transform.rotation";
            b.toValue = @(M_PI * .25);
            
            CABasicAnimation *c = [CABasicAnimation animation];
            c.keyPath = @"opacity";
            c.toValue = @(0);
            
            CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
            groupAnima.animations = @[a, b,c];
            groupAnima.duration = 1;
            groupAnima.fillMode = kCAFillModeForwards;
            groupAnima.delegate = self;
            
            groupAnima.removedOnCompletion = NO;
//            groupAnima.fillMode = kCAFillModeForwards;
            
            [topView.layer addAnimation:groupAnima forKey:nil];
            break;
        }
        default: {
            break;
        }
    }



    
}
#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if (flag) {

        [self removeFromSuperview];
    }
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

@end
