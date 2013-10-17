//
//  OrderingViewController.h
//  DC
//
//  Created by luajin on 13-9-26.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderingList.h"
#import "OrderingView.h"

@interface OrderingViewController : UIViewController{
    
    OrderingList *OrderingList;
    OrderingView *theOrderingView;
    
}

@property(nonatomic,strong)OrderingList *OrderingList;


@end
