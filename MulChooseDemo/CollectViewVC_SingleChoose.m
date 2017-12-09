//
//  SingleChooseCollectVC.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "CollectViewVC_SingleChoose.h"
#import "SingleChooseCollectview.h"

@interface CollectViewVC_SingleChoose ()
@property(nonatomic,weak)SingleChooseCollectview * MyCollectView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@end

@implementation CollectViewVC_SingleChoose
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //增加数据
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"AddArr" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    _dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    _dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    [self.view addSubview:self.MyCollectView];
}


-(SingleChooseCollectview *)MyCollectView{
    if (!_MyCollectView) {
        _MyCollectView = [SingleChooseCollectview ShareCollectviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height)];
        _MyCollectView.dataArr = _dataArr;
        //选中内容
        _MyCollectView.block = ^(NSString *chooseContent,NSIndexPath *indexPath){
            NSLog(@"数据：%@ ；第%ld行",chooseContent,indexPath.row);
        };
    }
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
