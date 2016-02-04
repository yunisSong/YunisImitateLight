//
//  TopicObj+request.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "TopicObj+request.h"

@implementation TopicObj (request)
+ (void)requestWithTagID:(NSString *)tagId
                  result:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //设置超时时间
    manager.requestSerializer.timeoutInterval = 45;
    
    [manager GET:@"http://l.m.163.com/light/allTopics.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        success(operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 超时
        failure(operation,error);
        
    }];
    
    
}
@end
