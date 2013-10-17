//
//  AppDelegate.h
//  DC
//
//  Created by luajin on 13-9-26.
//  Copyright (c) 2013年 luajin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UINavigationController *navController;
}

@property (strong,nonatomic)UIWindow *window;
@property (strong,nonatomic)UINavigationController *navController;

@end

