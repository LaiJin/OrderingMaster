//
//  RestaurantViewController.m
//  DC
//
//  Created by luajin on 13-9-27.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "RestaurantViewController.h"
#import "TableView.h"
@interface RestaurantViewController ()

@end

@implementation RestaurantViewController

@synthesize RestaurantData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"选餐厅";
    [self setRestaurantData:[NSMutableArray arrayWithObjects:@"KFC",@"7-11",@"成都小吃",nil]];
    TableView *RestaurantTableView = [[TableView alloc]init];
    [RestaurantTableView initTableView:self];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.RestaurantData count];
    
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *RestaurantCellIdentifier = @"MyIRestaurantdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RestaurantCellIdentifier];
    
    if (cell == nil) 
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:RestaurantCellIdentifier];
        
    cell.textLabel.text = [self.RestaurantData objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RestaurantData" object:[RestaurantData objectAtIndex:row] userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
