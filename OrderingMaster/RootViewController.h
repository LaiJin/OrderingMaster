//
//  RootViewController.h
//  DC
//
//  Created by luajin on 13-9-26.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderingList.h"
#import "RootView.h"

@interface RootViewController : UIViewController{
    
    OrderingList   *OrderingList;
    RootView *rootView;
}


@property(nonatomic,strong) OrderingList *OrderingList;




@end
