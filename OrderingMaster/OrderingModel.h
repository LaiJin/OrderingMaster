//
//  OrderingModel.h
//  OrderingMaster
//
//  Created by LunaJin on 13-10-8.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OrderingModel : NSObject<NSCoding>


@property(nonatomic,strong)NSString *PeopleName;
@property(nonatomic,strong)NSString *RestaurantName;
@property(nonatomic,strong)NSString *MealName;
@property(nonatomic,strong)NSString *MealPrice;



@end
