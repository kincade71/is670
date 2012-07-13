//
//  ViewController.h
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    
    IBOutlet UILabel *rotorI;
    IBOutlet UILabel *rotorII;
    IBOutlet UILabel *rotorIII;
    IBOutlet UILabel *reflector;
    
    IBOutlet UITextField *plug;
    
    
    IBOutlet UIPickerView *rotorAlpha1;
    IBOutlet UIPickerView *rotorAlpha2;
    IBOutlet UIPickerView *rotorAlpha3;
    IBOutlet UIPickerView *reflectorPick;
    IBOutlet UIButton *SaveButton;
    
    NSArray *rotorIArray;
    NSArray *reflectorArray;
    
}

- (IBAction)SaveInfo:(id)sender;

- (IBAction)ReturnButton:(id)sender;

@end
