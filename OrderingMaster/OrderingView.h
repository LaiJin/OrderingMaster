//
//  OrderingView.h
//  OrderingMaster
//
//  Created by xyooyy on 13-10-16.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderingView : UIView{
    
    UITextField  *PersonnelTextField;
    UITextField  *RestaurantTextField;
    UITextField  *MealTextField;
    UIButton     *MealButton;
    UIButton     *ConfirmButton;
    
}


@property(nonatomic,strong)UITextField  *PersonnelTextField;
@property(nonatomic,strong)UITextField  *RestaurantTextField;
@property(nonatomic,strong)UITextField  *MealTextField;
@property(nonatomic,strong)UIButton     *ConfirmButton;
@property(nonatomic,strong)UIButton     *MealButton;


-(void)initOrderingView :(UIViewController*)OrderingViewController;

@end
