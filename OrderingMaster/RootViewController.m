//
//  RootViewController.m
//  DC
//
//  Created by luajin on 13-9-26.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "RootViewController.h"
#import "OrderingViewController.h"
#import "OrderFormViewController.h"
#import "RootView.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize OrderingList;
//@synthesize rootView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//接收按下确认按钮传递来的通知
- (id)init
{
    self = [super init];
    if(self)
    {
        [[NSNotificationCenter defaultCenter]  addObserver:self
                selector:@selector(activationOrderFormButton)name:@"CofimButtonClick" object:nil];
    }
    return self;
}



-(void)activationOrderFormButton{
    
  
    [self.OrderingList recallorderingList];
    if ([self.OrderingList countOftheOrderingList] != 0)
        rootView.OrderFormButton.enabled = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"订餐";
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"back" style:0 target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBarButton;
    rootView = [[RootView alloc]init];
    [rootView initRootView:self];
    
    self.OrderingList = [[OrderingList alloc]init];
    [self activationOrderFormButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按下帮订单按钮触发的事件
-(void)theOrderingButtonClick{
    
    OrderingViewController *OrderingView = [[OrderingViewController alloc]init ];
    [self.navigationController pushViewController:OrderingView animated:YES];
}


//按下看订单按钮后触发的事件
-(void)theOrderFormButtonClick{
    
    OrderFormViewController *OrderFormView = [[OrderFormViewController alloc]init];
    [self.navigationController pushViewController:OrderFormView animated:YES];
    
}


-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CofimButtonClick" object:nil];
    
}

@end
