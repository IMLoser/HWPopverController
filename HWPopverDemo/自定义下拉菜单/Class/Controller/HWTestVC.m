//
//  HWTestVC.m
//  自定义下拉菜单
//
//  Created by 曹航玮 on 2017/1/19.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

#import "HWTestVC.h"
#import "HWTableViewCell.h"

@interface HWTestVC ()

@property (strong, nonatomic) NSMutableArray * dataArray;

@end

@implementation HWTestVC

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"黄色",@"红色",@"灰色",@"橙色",@"白色",@"绿色", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HWTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.colorLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedBlock(indexPath.row);
}


@end
