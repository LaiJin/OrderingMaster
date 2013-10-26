//
//  OrderingModel.m
//  OrderingMaster
//
//  Created by LunaJin on 13-10-8.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderingModel.h"

@implementation OrderingModel




- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if(self)
        
    self.PeopleName = [aDecoder decodeObjectForKey:@"peoplename"];
    self.RestaurantName = [aDecoder decodeObjectForKey:@"restaurantname"];
    self.MealName = [aDecoder decodeObjectForKey:@"mealname"];
    self.MealPrice = [aDecoder decodeObjectForKey:@"mealprice"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.PeopleName forKey:@"peoplename"];
    [aCoder encodeObject:self.RestaurantName forKey:@"restaurantname"];
    [aCoder encodeObject:self.MealName forKey:@"mealname"];
    [aCoder encodeObject:self.MealPrice forKey:@"mealprice"];
    
}
@end
