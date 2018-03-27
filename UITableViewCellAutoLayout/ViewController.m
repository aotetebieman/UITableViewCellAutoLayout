//
//  ViewController.m
//  UITableViewCellAutoLayout
//
//  Created by 卢会旭 on 2018/3/27.
//  Copyright © 2018年 卢会旭. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "AutoLayoutTableViewCell.h"
#import "AutolayoutTableViewCellXib.h"
static NSString *indentifier = @"autoLayoutCell";//唯一标识符
static NSString *xibIndentifier = @"autoLayoutCellXib";//唯一标识符
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTableView;

//数据源
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ViewController
//懒加载
-(UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        //设置单元格高度为自适应
        _myTableView.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_myTableView];
    }
    return _myTableView;
}
-(NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取假的数据源
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil]];
    for (NSDictionary *dic in arr) {
        CellModel *model = [[CellModel alloc] init];
        model.user = dic[@"user"];
        model.content = dic[@"content"];
        [self.dataSource addObject:model];
    }
    //刷新数据
    [self.myTableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
//返回单元格的预估高度,实现此代理使 cellForRowAtIndexPath 和 heightForRowAtIndexPath代理方法调用顺序变化
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
            //xib适配
            AutolayoutTableViewCellXib *cell = [tableView dequeueReusableCellWithIdentifier:xibIndentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"AutolayoutTableViewCellXib" owner:self options:nil] lastObject];
            }
            cell.model = self.dataSource[indexPath.row];
            return cell;
        }
            break;
        default:{
            //代码适配
            AutoLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
            if (!cell) {
                cell = [[AutoLayoutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
            }
            cell.model = self.dataSource[indexPath.row];
            return cell;
            
        }
            break;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.backgroundColor = [UIColor grayColor];
    titleLable.textColor = [UIColor whiteColor];
    if (section == 0) {
        titleLable.text = @"Xib适配";
    }else {
        titleLable.text = @"纯代码适配";
    }
    return titleLable;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
