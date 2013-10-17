//
//  OrderingModel.m
//  OrderingMaster
//
//  Created by LunaJin on 13-10-8.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderingModel.h"

@implementation OrderingModel

@synthesize PeopleName,MealPrice,MealName,RestaurantName;


- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if(self)
        
    PeopleName = [aDecoder decodeObjectForKey:@"peoplename"];
    RestaurantName = [aDecoder decodeObjectForKey:@"restaurantname"];
    MealName = [aDecoder decodeObjectForKey:@"mealname"];
    MealPrice = [aDecoder decodeObjectForKey:@"mealprice"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:PeopleName forKey:@"peoplename"];
    [aCoder encodeObject:RestaurantName forKey:@"restaurantname"];
    [aCoder encodeObject:MealName forKey:@"mealname"];
    [aCoder encodeObject:MealPrice forKey:@"mealprice"];
    
}
@end
