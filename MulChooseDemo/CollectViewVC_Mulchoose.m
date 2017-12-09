//
//  CollectViewMulchoose.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "CollectViewVC_Mulchoose.h"
#import "MulChooseCollectView.h"

@interface CollectViewVC_Mulchoose ()
@property(nonatomic,weak)MulChooseCollectView * MyCollectView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@end

@implementation CollectViewVC_Mulchoose
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //增加数据
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"AddArr" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    _dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    _dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    [self.view addSubview:self.MyCollectView];
}

-(MulChooseCollectView *)MyCollectView{
    if (!_MyCollectView) {
        _MyCollectView = [MulChooseCollectView  ShareCollectviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height) HeaderTitle:@"全选"];
        _MyCollectView.dataArr = _dataArr;
        //选中内容
        _MyCollectView.block = ^(NSString *chooseContent,NSMutableArray *chooseArr){
            NSLog(@"%@ %@",chooseContent,chooseArr);
        };
    }
    return _MyCollectView;
    return _MyCollectView;
}


//增加数据刷新（可根据实际情况修改）
-(void)click{
    NSUInteger CurrentCount = _dataArr.count;
    for (int i=1; i<=10; i++) {
        [_dataArr addObject:[NSString stringWithFormat:@"%lu",CurrentCount+i]];
    }
    _MyCollectView.dataArr = _dataArr;
    [_MyCollectView ReloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
