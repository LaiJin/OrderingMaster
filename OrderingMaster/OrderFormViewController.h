//
//  OrderFormViewController.h
//  OrderingMaster
//
//  Created by luajin on 13-10-1.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderingList.h"
#import "OrderFormView.h"

@interface OrderFormViewController : UITableViewController{
    
    OrderFormView *OrderFormTableView;
    OrderingList  *OrderingList;
    
}


@property(nonatomic,strong)OrderingList   *OrderingList;
@end
