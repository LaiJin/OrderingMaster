//
//  OrderingViewController.m
//  DC
//
//  Created by luajin on 13-9-26.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderingViewController.h"
#import "PersonnelViewController.h"
#import "RestaurantViewController.h"
#import "MealViewController.h"
#import "OrderingModel.h"

@interface OrderingViewController ()

@end

@implementation OrderingViewController

@synthesize OrderingList,MealPrice;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//定义接收通知的函数
-(void)addNotificationObserver :(SEL)selector :(NSString*)name{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:selector name:name object:nil];
    
}

//接收分别触发了人员列表 餐厅列表 套餐列表的cell传递来的通知
- (id)init
{
    self = [super init];
    if(self)
    {
        [self addNotificationObserver:@selector(personnelText:)  :@"PersonnelData"];
        [self addNotificationObserver:@selector(restaurantText:) :@"RestaurantData"];
        [self addNotificationObserver:@selector(mealText:)       :@"MealData"];
        [self addNotificationObserver:@selector(mealPrice:)      :@"MealPrice"];
    }
    return self;
}



-(void)personnelText:(NSNotification*)notification{
    
   
   theOrderingView.PersonnelTextField.text = [notification object];
    if (theOrderingView.MealTextField.text != nil && theOrderingView.RestaurantTextField.text != nil && theOrderingView.PersonnelTextField.text != nil)
        theOrderingView.ConfirmButton.enabled = YES;
}

-(void)restaurantText:(NSNotification*)notification{
    
    if (notification.object != theOrderingView.RestaurantTextField.text)
    {
        theOrderingView.MealTextField.text = nil;
        theOrderingView.ConfirmButton.enabled = NO;
        theOrderingView.RestaurantTextField.text = [notification object];
        theOrderingView.MealButton.enabled = YES;
    }
}

-(void)mealText:(NSNotification*)notification{
    
    theOrderingView.MealTextField.text = [notification object];
    if (theOrderingView.MealTextField.text != nil && theOrderingView.RestaurantTextField.text != nil&& theOrderingView.PersonnelTextField.text != nil)
        theOrderingView.ConfirmButton.enabled = YES;
}

-(void)mealPrice :(NSNotification*)notification{
 
    self.MealPrice = [notification object];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"订餐";
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"back" style:0 target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBarButton;
    theOrderingView = [[OrderingView alloc]init];
    [theOrderingView initOrderingView:self];
    
    self.OrderingList = [[OrderingList alloc]init]; 
    self.OrderingList.theNewModel = [[OrderingModel alloc]init];
    [self.OrderingList recallorderingList];
    [self.OrderingList inittheOrderingList];

	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//按下选人按钮触发的事件
-(void)thePersonnelButtonClick{
    
    PersonnelViewController *PersonnelController = [[PersonnelViewController alloc]init];
    [self.navigationController pushViewController:PersonnelController animated:YES];
    
}


//按下选餐厅按钮触发的事件
-(void)theRestaurantButtonClick{
    
    RestaurantViewController *RestaurantController = [[RestaurantViewController alloc]init];
    [self.navigationController pushViewController:RestaurantController animated:YES];
    
}

//按下选套餐触发的事件
-(void)theMealButtonClick{
    
    MealViewController *MealController = [[MealViewController alloc]init];
    [[NSNotificationCenter defaultCenter] postNotificationName: @"RestaurantTextField"
        object:theOrderingView.RestaurantTextField.text userInfo:nil];
    [self.navigationController pushViewController: MealController animated: YES];
    
}


//按下确认按钮触发的事件
-(void)theConfirmButtonClick{
    
    self.OrderingList.theNewModel.PeopleName =theOrderingView.PersonnelTextField.text;
    self.OrderingList.theNewModel.RestaurantName = theOrderingView.RestaurantTextField.text;
    self.OrderingList.theNewModel.MealName = theOrderingView.MealTextField.text;
    self.OrderingList.theNewModel.MealPrice = MealPrice;
    [self.OrderingList addOrderInfo];
    [self emptyPersonnelTextAndMealText];
    [[NSNotificationCenter defaultCenter]  postNotificationName: @"CofimButtonClick"  object: nil  userInfo:nil];
   
}
//按下确认按钮后清空选人和套餐列表
-(void)emptyPersonnelTextAndMealText{
    
    theOrderingView.PersonnelTextField.text = nil,theOrderingView.MealTextField.text = nil;
    
    if (theOrderingView.MealTextField.text == nil || theOrderingView.RestaurantTextField.text == nil || theOrderingView.PersonnelTextField.text == nil)
        theOrderingView.ConfirmButton.enabled = NO;
}
//定义取消接受通知对象的函数
-(void)removeNotificationObserver  :(NSString*)name{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
    
}

-(void)dealloc{
    
    [self removeNotificationObserver :@"PersonnelData"];
    [self removeNotificationObserver :@"RestaurantData"];
    [self removeNotificationObserver :@"MealData"];
    [self removeNotificationObserver :@"MealPrice"];
    
}

@end
