//
//  HomeDefultCell.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "HomeDefultCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation HomeDefultCell
- (void)handelSource:(HomeItemModel *)model
{
    self.topLabel.text = @"TOP1";
    self.TitleLabel.text = model.title;
    self.desLabel.text = model.digest;
    
    [self.titleImageView sd_setImageWithURL:[NSURL URLWithString:model.imageList[0].imgsrc] placeholderImage:nil];
    
    
}
- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = KViewBGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    self.desLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.desLabel.frame);
    self.topLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.topLabel.frame);
    self.TitleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.TitleLabel.frame);

    
}
@end
