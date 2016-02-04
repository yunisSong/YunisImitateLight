//
//  TopicObj+request.h
//  YunisImitateLight
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "TopicObj.h"

#import <AFNetworking/AFNetworking.h>
@interface TopicObj (request)
+ (void)requestWithTagID:(NSString *)tagId
                  result:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
