//
//  OrderFormView.h
//  OrderingMaster
//
//  Created by xyooyy on 13-10-16.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderFormView : UIView{
    
    UITableView *OrderFormTableView;
}


-(void)initOrderFormTableView :(UITableViewController *)OrderFormController :(NSString*)baseLabelText;
-(void)initRestaurantAndMealLabel :(CGRect)frame :(NSString*)text;

@end
