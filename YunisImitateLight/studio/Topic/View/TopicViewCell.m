//
//  TopicViewCell.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "TopicViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation TopicViewCell
- (void)handelSource:(TopicObj *)model
{
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
//    self.bgImageView.image = [UIImage imageNamed:@"snow.jpg"];
    self.titleLab.text = model.tname;
    self.desLab.text = model.desc;
}
- (void)awakeFromNib {
    // Initialization code
    self.contentView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
