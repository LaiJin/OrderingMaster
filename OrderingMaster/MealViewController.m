//
//  MealViewController.m
//  DC
//
//  Created by luajin on 13-9-27.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "MealViewController.h"
#import "TableView.h"

@interface MealViewController ()


@end

@implementation MealViewController

@synthesize MealData,MealPrice;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//接收按下选套餐按钮传递来的通知
- (id)init
{
    self = [super init];
    if(self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Restauranttext:) name:@"RestaurantTextField" object:nil];
    }
    return self;
}

-(void)initMealTableView{
    
    self.navigationItem.title = @"选套餐";
    TableView *MealTableView = [[TableView alloc]init];
    [MealTableView initTableView:self];
}

//定义KFC的套餐数据

#define Array(FIRST, ...) [NSMutableArray arrayWithObjects: FIRST, ##__VA_ARGS__, nil]

-(void)MealOfKFC{
    
    self.MealData = Array(@"田园脆鸡堡",@"黄金咖喱猪扒饭",@"意式肉酱肉丸饭",@"老北京鸡肉卷",@"劲脆鸡腿堡",nil);
    self.MealPrice = Array(@"10.00",@"23.50",@"16.00",@"14.00",@"15.00", nil);

    

}
//定义7-11的套餐数据
-(void)MealOfSeven{
    
    self.MealData = Array(@"全素",@"半素半荤",@"全荤",nil);
    self.MealPrice = Array(@"9.00",@"11.50",@"13.00", nil);

    
   
}
//定义成都小吃的套餐数据
-(void)MealOfChengdu{
    
    self.MealData = Array(@"西红柿鸡蛋盖饭",@"木须肉盖饭",@"尖椒肉丝盖饭",@"京酱肉丝盖饭",@"地三鲜盖饭",nil);
    self.MealPrice = Array(@"10.00",@"10.00",@"12.00",@"12.00",@"9.00", nil);

    

}
-(void)Restauranttext:(NSNotification*)notitication{
    
    [self initMealTableView];
    if ([[notitication object]isEqualToString:@"KFC"]) 
        [self MealOfKFC];
    
   if ([[notitication object]isEqualToString: @"7-11"])
        [self MealOfSeven];
    
    if ([[notitication object]isEqualToString: @"成都小吃"])
        [self MealOfChengdu];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.MealData count];
    
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *MealCellIdentifier = @"MyMealIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MealCellIdentifier];
    
    if (cell == nil) 
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MealCellIdentifier];
        

    NSString *MealPriceLabelText = [NSString stringWithFormat:@"¥%@",[self.MealPrice objectAtIndex:indexPath.row ]];
    cell.detailTextLabel.text = MealPriceLabelText;
    cell.textLabel.text = [self.MealData objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}


//定义传递通知函数
-(void)postNotification :(NSString*)name :(id)object{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:nil];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self postNotification:@"MealData" :[self.MealData objectAtIndex:indexPath.row]];
    [self postNotification:@"MealPrice":[self.MealPrice objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
