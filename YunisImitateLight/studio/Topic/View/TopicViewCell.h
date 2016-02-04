//
//  TopicViewCell.h
//  YunisImitateLight
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicObj.h"
@interface TopicViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *desLab;
- (void)handelSource:(TopicObj *)model;
@end
