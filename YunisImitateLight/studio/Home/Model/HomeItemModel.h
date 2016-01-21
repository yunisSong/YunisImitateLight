//
//  HomeItemModel.h
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Imagelist;
@interface HomeItemModel : NSObject

@property (nonatomic, copy) NSString *postid;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *digest;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) NSInteger shareCount;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<Imagelist *> *imageList;

@property (nonatomic, copy) NSString *boardid;

@end
@interface Imagelist : NSObject

@property (nonatomic, copy) NSString *lightDotTop;

@property (nonatomic, copy) NSString *pixel;

@property (nonatomic, copy) NSString *lightDotLeft;

@property (nonatomic, copy) NSString *bodyImgsrc;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *bodyPixel;

@end

