//
//  MessageViewController.h
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnigmaViewController.h"
#import "AFNetworking.h"

@interface MessageViewController : UITableViewController <UITabBarDelegate>
{
    
    IBOutlet UIBarButtonItem *backButton;
    
}
@property (nonatomic, strong) NSArray *retrieveMessagesArray;

- (IBAction)backToEnigma:(id)sender;

@end
