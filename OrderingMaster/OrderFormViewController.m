//
//  OrderFormViewController.m
//  OrderingMaster
//
//  Created by luajin on 13-10-1.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderFormViewController.h"

@interface OrderFormViewController ()

@end

@implementation OrderFormViewController

@synthesize OrderingList;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





-(void)CGRectRestaurantAndMealLabel{
    
    NSInteger i;CGFloat y = 63;
    for (i = 0; i < [self.OrderingList countOftheOrderingList]; i++) {
        OrderingModel *labelmodel = [self.OrderingList indexOrderingModel:i];
        NSString* labeltext = [NSString stringWithFormat:@"%@  %@",labelmodel.RestaurantName,labelmodel.MealName];
        [OrderFormTableView initRestaurantAndMealLabel:CGRectMake(10, y, 200, 15) :labeltext];
                y = y + 58;
    }
    
}



- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.OrderingList = [[OrderingList alloc]init];
    [self.OrderingList recallorderingList];
    OrderFormTableView = [[OrderFormView alloc]init];
    [OrderFormTableView initOrderFormTableView :self :[self.OrderingList MealPriceSum]];
    [self CGRectRestaurantAndMealLabel];
    
   
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger Row;
    if (section == 0) 
        Row = [self.OrderingList countOftheOrderingList];
    
    if (section == 1) 
        Row = 6-[self.OrderingList countOftheOrderingList];
    
    return Row;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *OrderFormCellIdentifier = @"MyOrderFormCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderFormCellIdentifier];
    
    if (cell == nil) 
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:OrderFormCellIdentifier];
    if (indexPath.section == 0) {
        OrderingModel *current = [self.OrderingList indexOrderingModel : indexPath.row];
        cell.textLabel.text = current.PeopleName;
        cell.detailTextLabel.text = [self mealPriceText:current :cell];
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = [self.OrderingList indexNotOrdering:indexPath.row];
        cell.detailTextLabel.text = nil;
    }
    return cell;
}


//返回订单页面价格显示红色的方法
-(NSString*)mealPriceText :(OrderingModel*)current :(UITableViewCell*)cell {
    
    NSString *MealPricetext = [NSString stringWithFormat:@"¥%@",current.MealPrice];
    
    if ([current.MealPrice floatValue] >= 12.00) 
        cell.detailTextLabel.textColor = [UIColor redColor];
    return MealPricetext;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 58;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *firstSection = [NSString stringWithFormat:@"%i人已定",[self.OrderingList   countOftheOrderingList]];
    NSString *secondSection = [NSString stringWithFormat:@"%i人未定",[self.OrderingList countOfNotOrderingPeople]];
    NSMutableArray *titleForHeader = [[NSMutableArray alloc]init];
    [titleForHeader addObject:firstSection];
    [titleForHeader addObject:secondSection];
    NSString *titleHeader = [titleForHeader objectAtIndex:section];
    return titleHeader;
    
}


@end
