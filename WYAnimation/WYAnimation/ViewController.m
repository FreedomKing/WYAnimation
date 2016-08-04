//
//  ViewController.m
//  WYAnimation
//
//  Created by yingwang on 16/7/29.
//  Copyright © 2016年 yingwang. All rights reserved.
//

#import "ViewController.h"
#import "WYAEmitterViewController.h"

@interface ViewController () <UITableViewDelegate,
                              UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _mainTableView.tableFooterView = [UIView new];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForTableCellAtIndex:(NSInteger)idx {
    
    NSString *title;
    switch (idx) {
        case 0:
            title = @"Emitter(粒子动画)";
            break;
        default:
            break;
    }
    return title;
}

#pragma mark - table view delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [self titleForTableCellAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class instance;
    switch (indexPath.row) {
        case 0:
            instance = [WYAEmitterViewController class];
            break;
        default:
            break;
    }
    UIViewController *controller = [[instance alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
