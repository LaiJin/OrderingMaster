//
//  RootView.h
//  OrderingMaster
//
//  Created by LunaJin on 13-10-15.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RootViewController.h"

@interface RootView : UIView{
    
    UIButton       *OrderFormButton;
    
}

@property(nonatomic,strong)UIButton *OrderFormButton;


-(void)initRootView :(UIViewController *)rootViewController;


@end
