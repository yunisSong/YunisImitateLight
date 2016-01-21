//
//  HomeListModel+request.h
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "HomeListModel.h"
#import <AFNetworking/AFNetworking.h>

@interface HomeListModel (request)

+ (void)requestWithTagID:(NSString *)tagId
                  result:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
