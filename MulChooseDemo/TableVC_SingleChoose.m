//
//  SingleTableChooseVC.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "TableVC_SingleChoose.h"
#import "SingleChooseTable.h"

@interface TableVC_SingleChoose ()
@property(nonatomic,weak)SingleChooseTable * MyTable;
@property(nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation TableVC_SingleChoose
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"AddArr" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];//初始化展示数据，可删除
    [self.view addSubview:self.MyTable];
}

-(SingleChooseTable *)MyTable{
    if (!_MyTable) {
        _MyTable = [SingleChooseTable ShareTableWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height)];
        _MyTable.dataArr = self.dataArr;
        [_MyTable ReloadData];
        //选中内容
        _MyTable.block = ^(NSString *chooseContent,NSIndexPath *indexPath){
            NSLog(@"数据：%@ ；第%ld行",chooseContent,indexPath.row);
        };
    }
    return _MyTable;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
       _dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataArr;
}

-(void)click{
    NSUInteger CurrentCount = _dataArr.count;
    for (int i=1; i<=10; i++) {
        [_dataArr addObject:[NSString stringWithFormat:@"%lu",CurrentCount+i]];
        
    }
    _MyTable.dataArr = _dataArr;
    [_MyTable ReloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
