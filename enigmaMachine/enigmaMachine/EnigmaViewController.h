//
//  EnigmaViewController.h
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnigmaViewController : UIViewController <UITextFieldDelegate>
{
   
    IBOutlet UITextField *rotor1;
    IBOutlet UITextField *rotor2;
    IBOutlet UITextField *rotor3;
    IBOutlet UITextField *text;
    
    IBOutlet UIButton *QButton;
    IBOutlet UIButton *WButton;
    IBOutlet UIButton *EButton;
    IBOutlet UIButton *RButton;
    IBOutlet UIButton *TButton;
    IBOutlet UIButton *ZButton;
    IBOutlet UIButton *UButton;
    IBOutlet UIButton *IButton;
    IBOutlet UIButton *OButton;
    IBOutlet UIButton *AButton;
    IBOutlet UIButton *SButton;
    IBOutlet UIButton *DButton;
    IBOutlet UIButton *FButton;
    IBOutlet UIButton *GButton;
    IBOutlet UIButton *HButton;
    IBOutlet UIButton *JButton;
    IBOutlet UIButton *KButton;
    IBOutlet UIButton *PButton;
    IBOutlet UIButton *YButton;
    IBOutlet UIButton *XButton;
    IBOutlet UIButton *CButton;
    IBOutlet UIButton *VButton;
    IBOutlet UIButton *BButton;
    IBOutlet UIButton *NButton;
    IBOutlet UIButton *MButton;
    IBOutlet UIButton *LButton;
    
    IBOutlet UIButton *RetrieveButton;
    
    
}
@property (nonatomic, retain) IBOutlet UITextField * text;
@property (nonatomic, retain) IBOutlet UITextField *rotor1;
@property (nonatomic, retain) IBOutlet UITextField *rotor2;
@property (nonatomic, retain) IBOutlet UITextField *rotor3;

- (IBAction)QTouched:(id)sender;
- (IBAction)WTouched:(id)sender;
- (IBAction)ETouched:(id)sender;
- (IBAction)RTouched:(id)sender;
- (IBAction)TTouched:(id)sender;
- (IBAction)ZTouched:(id)sender;
- (IBAction)UTouched:(id)sender;
- (IBAction)ITouched:(id)sender;
- (IBAction)OTouched:(id)sender;
- (IBAction)ATouched:(id)sender;
- (IBAction)STouched:(id)sender;
- (IBAction)DTouched:(id)sender;
- (IBAction)FTouched:(id)sender;
- (IBAction)GTouched:(id)sender;
- (IBAction)HTouched:(id)sender;
- (IBAction)JTouched:(id)sender;
- (IBAction)KTouched:(id)sender;
- (IBAction)PTouched:(id)sender;
- (IBAction)YTouched:(id)sender;
- (IBAction)XTouched:(id)sender;
- (IBAction)CTouched:(id)sender;
- (IBAction)VTouched:(id)sender;
- (IBAction)BTouched:(id)sender;
- (IBAction)NTouched:(id)sender;
- (IBAction)MTouched:(id)sender;
- (IBAction)LTouched:(id)sender;

- (IBAction)ClearText:(id)sender;
- (IBAction)SendText:(id)sender;
- (IBAction)SendPlainText:(id)sender;

- (IBAction)RetrieveMessage:(id)sender;


@end
