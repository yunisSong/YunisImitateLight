//
//  TopicViewController.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/20.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicObj+request.h"
#import "TopicViewCell.h"
@interface TopicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *SourceArray;
@property(nonatomic,strong)UITableView *baseTableView;
@end
static NSString *YunisTopicCellIdentifier = @"YunisTopicCellIdentifier";

@implementation TopicViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.navigationController.navigationBarHidden = YES;
    self.SourceArray = [NSMutableArray new];
    
    [self.view addSubview:self.baseTableView];
    
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [TopicObj requestWithTagID:nil result:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            TopicObj *b = [TopicObj mj_objectWithKeyValues:responseObject];
            if (b) {
                [self.SourceArray addObject:b];
            }

        }else if ([responseObject isKindOfClass:[NSArray class]])
        {
            [(NSArray *)responseObject enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                TopicObj *b = [TopicObj mj_objectWithKeyValues:obj];
                if (b) {
                    [self.SourceArray addObject:b];
                }
            }];
        }else
        {
            
        }
        [self.baseTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件
}
- (void)dealloc
{
    
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法
//代理方法
#pragma mark Table View DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.SourceArray.count;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return 44;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//re
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:YunisTopicCellIdentifier];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell handelSource:self.SourceArray[indexPath.row]];
    cell.backgroundColor = KGrayColor;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面
- (UITableView *)baseTableView{
    if (_baseTableView == nil) {
        _baseTableView = ({
            UITableView *baseTableView    = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
            baseTableView.delegate        = self;
            baseTableView.dataSource      = self;
            baseTableView.backgroundColor = [UIColor clearColor];
            baseTableView.backgroundView  = nil;
            baseTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
            baseTableView.rowHeight       = UITableViewAutomaticDimension;
            //            baseTableView.estimatedRowHeight = 120;
            //            baseTableView.rowHeight = UITableViewAutomaticDimension;
            [baseTableView registerNib:[UINib nibWithNibName:@"TopicViewCell" bundle:nil] forCellReuseIdentifier:YunisTopicCellIdentifier];
            baseTableView;
        });
    }
    
    return _baseTableView;
}

@end
