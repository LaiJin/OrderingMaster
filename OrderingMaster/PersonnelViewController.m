//
//  PersonnelViewController.m
//  DC
//
//  Created by luajin on 13-9-27.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "PersonnelViewController.h"
#import "OrderingViewController.h"
#import "TableView.h"

@interface PersonnelViewController ()
@end

@implementation PersonnelViewController

@synthesize PersonnelData;

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
    self.navigationItem.title = @"选人";
    [self setPersonnelData: [NSMutableArray  arrayWithObjects: @"赵大",@"钱二",@"张三",@"李四",@"王五",@"刘六",nil]];
    TableView *peopleView = [[TableView alloc]init];
    [peopleView initTableView:self];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.PersonnelData count];
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *PersonnelCellIdentifier = @"MyPersonnelIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonnelCellIdentifier];
    
    if (cell == nil) 
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:PersonnelCellIdentifier];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.PersonnelData objectAtIndex :indexPath.row];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSUInteger row = [indexPath row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PersonnelData" object:[self.PersonnelData objectAtIndex:row] userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
