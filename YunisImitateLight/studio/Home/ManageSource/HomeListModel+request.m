//
//  HomeListModel+request.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/21.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "HomeListModel+request.h"
@implementation HomeListModel (request)
+ (void)requestWithTagID:(NSString *)tagId
                  result:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //设置超时时间
    manager.requestSerializer.timeoutInterval = 45;
    
    [manager GET:[NSString stringWithFormat:@"http://l.m.163.com/light/reportArticle/list/%@/0-20.html",tagId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        

        success(operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 超时
        failure(operation,error);

    }];
    

}
@end
