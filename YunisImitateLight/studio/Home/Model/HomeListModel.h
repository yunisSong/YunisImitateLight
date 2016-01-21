

//
//  HomeListModel.h
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeItemModel.h"
@interface HomeListModel : NSObject

@property (nonatomic, copy) NSString *topicid;

@property (nonatomic, strong) NSArray<HomeItemModel *> *list;

@end

