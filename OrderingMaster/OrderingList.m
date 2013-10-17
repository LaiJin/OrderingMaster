//
//  OrderingList.m
//  OrderingMaster
//
//  Created by LunaJin on 13-10-8.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import "OrderingList.h"


@implementation OrderingList
{
    NSMutableArray *theOrderingList;
    NSMutableArray *notOreringPeople;
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if(self)
        theOrderingList = [aDecoder decodeObjectForKey:@"theorderinglist"];
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:theOrderingList forKey:@"theorderinglist"];
}


-(void)inittheOrderingList{
    
    if (!theOrderingList)
        theOrderingList = [[NSMutableArray alloc]init];
    
}

//读取订单数据
-(void)recallorderingList{
    
    NSString *codingPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    codingPath = [codingPath stringByAppendingPathComponent:@"orderinglist.plist"];
    theOrderingList = [NSKeyedUnarchiver unarchiveObjectWithFile:codingPath];

}

//增加订单
-(void)addOrderInfo{
    
    OrderingModel *copyModel = [[OrderingModel alloc]init];
    copyModel.PeopleName = self.theNewModel.PeopleName;
    copyModel.RestaurantName = self.theNewModel.RestaurantName;
    copyModel.MealName = self.theNewModel.MealName;
    copyModel.MealPrice = self.theNewModel.MealPrice;
    
    if ([theOrderingList count] == 0)
        [theOrderingList addObject:copyModel];
    
    [self controllerOrderingLise:copyModel];
    [self theOrderingListCoding];
}

//判断订单是否增加
-(void)controllerOrderingLise :(OrderingModel*)copyModel{
    
    int i;
    NSUInteger count = [theOrderingList count];
    for (i = 0; i < count; i++)
    {
        OrderingModel *theIndexmodel = [theOrderingList objectAtIndex:i];
        i = [self externalIfFunction:theIndexmodel :copyModel :i :count];
    }
    
}

-(int)externalIfFunction :(OrderingModel*)theIndexmodel :(OrderingModel*)copyModel :(int)i :(NSUInteger)count
{
    if ([theIndexmodel.PeopleName isEqualToString:copyModel.PeopleName] ) 
    {
        if ([theIndexmodel.RestaurantName isEqualToString:copyModel.RestaurantName] &&
            [theIndexmodel.MealName isEqualToString:copyModel.MealName]) return count;
        
        theIndexmodel.MealName = copyModel.MealName;
        theIndexmodel.MealPrice = copyModel.MealPrice;
        theIndexmodel.RestaurantName = copyModel.RestaurantName;
        return count;
    }
    if (![theIndexmodel.PeopleName isEqualToString:copyModel.PeopleName] && (i == count-1 ))
    [theOrderingList addObject:copyModel];
    return i;

}



//归档
-(void)theOrderingListCoding{
    
    NSString *codingPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    codingPath = [codingPath stringByAppendingPathComponent:@"orderinglist.plist"];
    [NSKeyedArchiver archiveRootObject:theOrderingList toFile:codingPath];
        
    
}

-(OrderingModel*)indexOrderingModel:(int)index{
    
    OrderingModel *indexOrderingModel = [theOrderingList objectAtIndex:index];
    return indexOrderingModel;
}


-(NSInteger)countOftheOrderingList{
    
    return [theOrderingList count];
}

-(NSInteger)countOfNotOrderingPeople{
    
    return [notOreringPeople count];
}


-(NSString*)MealPriceSum{
    
    int i;
    float MealPriceSum = 0.0;
    for (i = 0; i < [theOrderingList count]; i++)
    {
        OrderingModel *outOrderingModel = [theOrderingList objectAtIndex:i];
        MealPriceSum += [outOrderingModel.MealPrice floatValue];
    }
    NSString *PriceSumText = [NSString stringWithFormat:@"%i人已定，%i人未定，总计%.2f元",[theOrderingList count],[notOreringPeople count],MealPriceSum];
    return PriceSumText;
}


-(NSString*)indexNotOrdering:(int)index{
    
    NSMutableArray *AllPeople = [NSMutableArray arrayWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五",@"刘六", nil];
    for (int i = 0; i < [theOrderingList count]; i++)
        [self compareOrderPeople:i :AllPeople];
    notOreringPeople = [NSMutableArray arrayWithArray:AllPeople];
    NSString *labeltext = [notOreringPeople objectAtIndex:index];
    return labeltext;
    
}


-(void)compareOrderPeople :(int)i  :(NSMutableArray*)AllPeople{
    

    for (int j = 0; j < [AllPeople count] ; j++)
    {
        OrderingModel *compareModel = [theOrderingList objectAtIndex:i];
        if ([compareModel.PeopleName isEqualToString:[AllPeople objectAtIndex:j]])
        {
            [AllPeople removeObjectAtIndex:j];
            j--;
        }
    }
}

@end
