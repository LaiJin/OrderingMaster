//
//  OrderingView.m
//  OrderingMaster
//
//  Created by xyooyy on 13-10-16.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderingView.h"

@implementation OrderingView

@synthesize PersonnelTextField,RestaurantTextField,MealTextField;
@synthesize ConfirmButton,MealButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) initPeopleOrRestaurantButton :(CGRect)frame  :(NSString*)title : (SEL) sel :(UIViewController*)OrderingViewController{
    
    UIButton *Button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Button setFrame:frame];
    [Button addTarget:OrderingViewController action:sel forControlEvents:UIControlEventTouchUpInside];
    [Button setTitle:title forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Button setEnabled:YES];
    [OrderingViewController.view addSubview:Button];
}

-(void)initPersonnelButton:(CGRect)frame  :(NSString*)title  :(UIViewController*) OrderingViewController{
    
    [self initPeopleOrRestaurantButton:frame :title :@selector(thePersonnelButtonClick) :OrderingViewController];
    
}
-(void)initRestaurantButton: (CGRect)frame :(NSString*)title  :(UIViewController*) OrderingViewController{
    
    
    [self initPeopleOrRestaurantButton:frame :title :@selector(theRestaurantButtonClick) :OrderingViewController];
    
}

-(void)initMealButtonOrConfirmButton :(UIButton*)button :(CGRect)frame  :(NSString*)title :(SEL)sel :(UIViewController*) OrderingViewController{
    
    [button setFrame:frame];
    [button setEnabled:NO];
    [button addTarget:OrderingViewController action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [OrderingViewController.view addSubview:button];
    
}

-(void)initMealButton :(CGRect)frame  :(NSString*)title  :(UIViewController*) OrderingViewController{
    
    MealButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self initMealButtonOrConfirmButton:MealButton :frame :title :@selector(theMealButtonClick) :OrderingViewController];
    
    
}

- (void)initConfirmButton :(CGRect)frame  :(NSString*)title  :(UIViewController*) OrderingViewController {
    
    ConfirmButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self initMealButtonOrConfirmButton:ConfirmButton :frame :title :@selector(theConfirmButtonClick) :OrderingViewController];
    
}



-(void)initLabel:(CGRect)fame :(NSString*)text :(UIViewController*)OrderingViewController{
    
    UILabel *Label = [[UILabel alloc]init];
    [Label setFrame:fame];
    [Label setText:text];
    [OrderingViewController.view addSubview:Label];
    
}


-(void)initPersonnelLabel:(CGRect)fame : (NSString*)text :(UIViewController*)OrderingViewController{
    
    [self initLabel :fame :text :OrderingViewController];
    
}

-(void)initRestaurantLabel:(CGRect)fame : (NSString*)text :(UIViewController*)OrderingViewController{
    
    [self initLabel: fame: text :OrderingViewController];
    
}
-(void)initMealLabel:(CGRect)fame : (NSString*)text :(UIViewController*)OrderingViewController{
    
    [self initLabel:fame :text :OrderingViewController];
    
}


-(void)initTextField :(UITextField*)textFiled :(CGRect)fame :(UIViewController*)OrderingViewController {
    
    [textFiled setFrame:fame];
    [textFiled setBorderStyle:UITextBorderStyleRoundedRect];
    [textFiled setEnabled:NO];
    [OrderingViewController.view addSubview:textFiled];
    
}

-(void)initPesonnelTextField :(CGRect)frame :(UIViewController*)OrderingViewController  {
    
    PersonnelTextField = [[UITextField alloc]init] ;
    [self initTextField:PersonnelTextField :frame :OrderingViewController];
    
}

-(void)initRestaurantTextField :(CGRect)fame :(UIViewController*)OrderingViewController {
    
    
    RestaurantTextField = [[UITextField alloc]init];
    [self initTextField:RestaurantTextField :fame :OrderingViewController];
    
}

-(void)initMealTextField :(CGRect)fame :(UIViewController*)OrderingViewController {
    
    
    MealTextField = [[UITextField alloc]init];
    [self initTextField:MealTextField :fame :OrderingViewController];
    
}


-(void)initOrderingView :(UIViewController*)OrderingViewController{
    

    [self initPersonnelLabel:CGRectMake(10, 5, 25, 15) :@"人:" :OrderingViewController];
    [self initRestaurantLabel:CGRectMake(10, 110, 40, 15) :@"餐厅:" :OrderingViewController];
    [self initMealLabel:CGRectMake(10, 215, 40, 15) :@"套餐:" :OrderingViewController];
    [self initPesonnelTextField:CGRectMake(10, 23, 300, 40) :OrderingViewController];
    [self initRestaurantTextField:CGRectMake(10, 128, 300, 40) :OrderingViewController];
    [self initMealTextField:CGRectMake(10, 233, 300, 40) :OrderingViewController];
    [self initPersonnelButton:CGRectMake(10, 65, 300, 40) :@"选人" :OrderingViewController];
    [self initRestaurantButton:CGRectMake(10,170,300, 40):@"选餐厅":OrderingViewController];
    [self initMealButton:CGRectMake(10, 275, 300, 40) :@"选套餐" :OrderingViewController];
    [self initConfirmButton:CGRectMake(10, 317, 300, 40) :@"确认" :OrderingViewController];

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
