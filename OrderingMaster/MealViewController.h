//
//  MealViewController.h
//  DC
//
//  Created by luajin on 13-9-27.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MealViewController : UITableViewController{
    
    NSMutableArray *MealData;
    NSMutableArray *MealPrice;
}


@property(nonatomic,strong)NSMutableArray *MealData;
@property(nonatomic,strong)NSMutableArray *MealPrice;

@end
