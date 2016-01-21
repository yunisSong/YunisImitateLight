//
//  HomeViewController.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/20.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeDefultCell.h"
#import "YunisTopShowHUD.h"
#import "HomeListModel+request.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    HomeListModel *source;
}
@property(nonatomic,strong)UITableView *baseTableView;
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@end
static NSString *YunisCellIdentifier = @"YunisDefultCellCTY";
@implementation HomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.navigationController.navigationBarHidden = YES;
    self.offscreenCells = [NSMutableDictionary new];
    [self.view addSubview:self.baseTableView];
    
    
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [HomeListModel requestWithTagID:@"00961AVG" result:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                source = [HomeListModel mj_objectWithKeyValues:responseObject];
                
                [self.baseTableView reloadData];
            }else
            {
                NSLog(@"数据格式有误");
            }
            
            NSLog(@"source == %@ %d",source.list[0].title,source.list.count);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error == %@",error);
        }];
        

        
    });
    
    

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
- (void)showShareHUDView
{
    
    YunisTopShowHUD *t = [YunisTopShowHUD showWithType:0 AnimationType:1];
    
    [t show];
}
#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法
#pragma mark Table View DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return source.list.count;
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
    HomeDefultCell *cell;
    
    cell = [self.offscreenCells objectForKey:YunisCellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeDefultCell" owner:self options:nil] lastObject];
        [self.offscreenCells setObject:cell forKey:YunisCellIdentifier];
    }

    [cell handelSource:source.list[indexPath.row]];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    
//    CGSize maximumSize = CGSizeMake(320.0, UILayoutFittingCompressedSize.height);
//    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:maximumSize].height;
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 5;
    return height;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeDefultCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:YunisCellIdentifier];
    [cell handelSource:source.list[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = KGrayColor;
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 500.0f;
//}
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
            baseTableView.backgroundColor = [UIColor whiteColor];
            baseTableView.backgroundView  = nil;
            baseTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
            baseTableView.rowHeight       = UITableViewAutomaticDimension;
//            baseTableView.estimatedRowHeight = 120;
//            baseTableView.rowHeight = UITableViewAutomaticDimension;
            [baseTableView registerNib:[UINib nibWithNibName:@"HomeDefultCell" bundle:nil] forCellReuseIdentifier:YunisCellIdentifier];
            baseTableView;
        });
    }
    
    return _baseTableView;
}

@end
