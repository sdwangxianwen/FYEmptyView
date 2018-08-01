//
//  ViewController.m
//  emptyView
//
//  Created by wang on 2018/7/31.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "ViewController.h"
#import "FYEmptyView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *mainTableView;
@property(nonatomic,strong) NSArray  *arr; //模拟的数据源
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.tableFooterView = [UIView new];
    if (self.arr.count == 0) {
   
        [FYEmptyView showInView:self.view completc:^{
            UIViewController *vc = [[UIViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
