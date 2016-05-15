//
//  DemonstrateController.m
//  Dynamic
//
//  Created by my young on 16/5/15.
//  Copyright © 2016年 lijiongjiong. All rights reserved.
//

#import "DemonstrateController.h"
#import "DemoController.h"

@interface DemonstrateController ()

@property (strong, nonatomic) NSArray *plistArr;

@end

@implementation DemonstrateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  导航栏标题
    self.navigationItem.title = @"物理仿真演示";
}

#pragma mark - 选中cell的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //  创建实例控制器
    DemoController *demon = [[DemoController alloc] init];
    
    //  设置标题
    demon.navigationItem.title = self.plistArr[indexPath.row];
    
    //  设置返回按钮的文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //  判断跳到哪个控制器
    demon.dome = (int)indexPath.row;
    
    //  push进入控制器
    [self.navigationController pushViewController:demon animated:YES];
    
    
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.plistArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    
    //  创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //  设置数据
    cell.textLabel.text = self.plistArr[indexPath.row];
    
    //  返回cell
    return cell;
}

#pragma mark - 懒加载数据
- (NSArray *)plistArr {
    if (_plistArr == nil) {
        _plistArr = @[@"吸附行为",@"推动行为", @"刚性附着行为", @"弹性附着行为", @"碰撞检测"];
    }
    return _plistArr;
}

@end
