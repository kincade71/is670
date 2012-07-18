//
//  AppDelegate.h
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "LogInViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
    LogInViewController * _viewController;
}


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Facebook *facebook;
@property (nonatomic, strong) LogInViewController *_viewController;

@end
