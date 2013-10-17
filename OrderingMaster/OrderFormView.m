//
//  OrderFormView.m
//  OrderingMaster
//
//  Created by xyooyy on 13-10-16.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderFormView.h"

@implementation OrderFormView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


//初始化一个显示餐厅和套餐标签
-(void)initRestaurantAndMealLabel :(CGRect)frame :(NSString*)text{
    
    UILabel *RestaurantAndMealLabel= [[UILabel alloc]init ];
    RestaurantAndMealLabel.textColor = [UIColor grayColor];
    RestaurantAndMealLabel.backgroundColor = [UIColor clearColor];
    RestaurantAndMealLabel.frame = frame;
    RestaurantAndMealLabel.text = text;
    [OrderFormTableView addSubview:RestaurantAndMealLabel];
}




//初始化一个底部的Label
-(void)initBaseLabel:(NSString*)baseLabelText{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 388, 320, 30)];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = baseLabelText;
    label.textColor = [UIColor whiteColor];
    [OrderFormTableView addSubview:label];
}

-(void)initOrderFormTableView :(UITableViewController *)OrderFormController :(NSString*)baseLabelText{
    
    OrderFormTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    OrderFormTableView.dataSource =OrderFormController;
    OrderFormTableView.delegate = OrderFormController;
    [OrderFormController.view addSubview:OrderFormTableView];
    [self initBaseLabel :baseLabelText];
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
