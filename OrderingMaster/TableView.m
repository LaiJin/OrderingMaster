//
//  TableView.m
//  OrderingMaster
//
//  Created by xyooyy on 13-10-16.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "TableView.h"

@implementation TableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)initTableView :(UITableViewController *)TableViewController{
    
    UITableView *TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    TableView.dataSource = TableViewController;
    TableView.delegate = TableViewController;
    [TableViewController.view addSubview:TableView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
