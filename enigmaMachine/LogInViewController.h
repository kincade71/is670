//
//  LogInViewController.h
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Facebook.h"

@interface LogInViewController : UITabBarController
{
    Facebook * facebook;
    
    IBOutlet UIButton *startApp;
}

@property (nonatomic, strong) Facebook *facebook;
@property (nonatomic, strong) UIButton *start;

- (IBAction)beginApp:(id)sender;
@end
