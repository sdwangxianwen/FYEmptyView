//
//  ViewController.m
//  emptyView
//
//  Created by wang on 2018/7/31.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "ViewController.h"
#import "FYEmptyView.h"
#import "UITableView+empety.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITableViewEmpetyDelegate>
@property(nonatomic,strong) UITableView *mainTableView;
@property(nonatomic,strong) NSArray  *arr; //模拟的数据源
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 200, 400) style:(UITableViewStylePlain)];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.tableFooterView = [UIView new];
    self.mainTableView.showEmptyView = YES;
}

-(void)emptyReloadData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mainTableView reloadData];
    });
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
