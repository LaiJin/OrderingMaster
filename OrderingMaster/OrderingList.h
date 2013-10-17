//
//  OrderingList.h
//  OrderingMaster
//
//  Created by LunaJin on 13-10-8.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderingModel.h"


@interface OrderingList : NSObject<NSCoding>


@property(nonatomic,strong) OrderingModel *theNewModel;



-(void)recallorderingList;
-(void)addOrderInfo;
-(void)inittheOrderingList;
-(OrderingModel*)indexOrderingModel :(int) index;
-(NSInteger)countOftheOrderingList;
-(NSInteger)countOfNotOrderingPeople;
-(NSString*)MealPriceSum;
-(NSString*)indexNotOrdering :(int)index;



@end
