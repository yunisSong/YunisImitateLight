//
//  HomeDefultCell.h
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeItemModel.h"
#import "ShareView.h"
@interface HomeDefultCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleImageViewConstraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LabtopConstraints;

@property (weak, nonatomic) IBOutlet ShareView *shareView;

- (void)handelSource:(HomeItemModel *)model;
- (void)hiddenImageView;
- (void)showTopIndex:(NSInteger)topIndex;
@end
