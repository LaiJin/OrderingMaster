//
//  RootView.m
//  OrderingMaster
//
//  Created by LunaJin on 13-10-15.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "RootView.h"

@implementation RootView

@synthesize OrderFormButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)initButton :(UIButton*)button :(CGRect)frame :(NSString*)title :(UIColor*)titleColor :(SEL)sel :(BOOL)enabled :(UIViewController*)rootViewController{
    
    [button setFrame:frame];
    [button addTarget:rootViewController action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setEnabled:enabled];
    [rootViewController.view addSubview:button];
}

//初始化帮订餐按钮
- (void)initOrderingButton :(CGRect)frame  :(NSString*)title :(UIColor*)titleColor :(UIViewController*)rootViewController 
{
    UIButton *OrderingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self initButton:OrderingButton :frame :title :titleColor : @selector(theOrderingButtonClick) :YES:rootViewController];
}

//初始化看订单按钮
- (void)initOrderFormButton :(CGRect)frame  :(NSString*)title :(UIColor*)titleColor :(UIViewController*)rootViewController 
{
    OrderFormButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self initButton:OrderFormButton :frame :title :titleColor :@selector(theOrderFormButtonClick) :NO :rootViewController];
}


-(void)initRootView :(UIViewController *)rootViewController {
    
    [self initOrderingButton:CGRectMake(10, 20, 300, 40) :@"帮订餐" :[UIColor blackColor] :rootViewController ];
    [self initOrderFormButton:CGRectMake(10, 70, 300, 40) :@"看订单" :[UIColor blackColor] :rootViewController];
    
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
