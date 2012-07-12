//
//  EnigmaViewController.m
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EnigmaViewController.h"

@interface EnigmaViewController ()

@end

@implementation EnigmaViewController
@synthesize text;
@synthesize rotor1,rotor2,rotor3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    text = nil;
    rotor3 = nil;
    rotor2 = nil;
    rotor1 = nil;
    
    QButton = nil;
    WButton = nil;
    EButton = nil;
    RButton = nil;
    TButton = nil;
    ZButton = nil;
    UButton = nil;
    IButton = nil;
    OButton = nil;
    AButton = nil;
    SButton = nil;
    DButton = nil;
    FButton = nil;
    GButton = nil;
    HButton = nil;
    JButton = nil;
    KButton = nil;
    PButton = nil;
    YButton = nil;
    XButton = nil;
    CButton = nil;
    VButton = nil;
    BButton = nil;
    NButton = nil;
    MButton = nil;
    LButton = nil;
   
  
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)textfieldShouldReturn: (UITextField *) textField
{
    
    [textField resignFirstResponder];
    return YES;
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)QTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'Q'];
}

- (IBAction)WTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'W'];
}

- (IBAction)ETouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'E'];
}

- (IBAction)RTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'R'];
}

- (IBAction)TTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'T'];
}

- (IBAction)ZTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'Z'];
}

- (IBAction)UTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'U'];
}

- (IBAction)ITouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'I'];
}

- (IBAction)OTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'O'];
}

- (IBAction)ATouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'A'];
}

- (IBAction)STouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'S'];
}

- (IBAction)DTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'D'];
}

- (IBAction)FTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'F'];
}

- (IBAction)GTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'G'];
}

- (IBAction)HTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'H'];
}

- (IBAction)JTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'J'];
}

- (IBAction)KTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'K'];
}

- (IBAction)PTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'P'];
}

- (IBAction)YTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'Y'];
}

- (IBAction)XTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'X'];
}

- (IBAction)CTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'C'];
}

- (IBAction)VTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'V'];
}

- (IBAction)BTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'B'];
}

- (IBAction)NTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'N'];
}

- (IBAction)MTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'M'];
}

- (IBAction)LTouched:(id)sender 
{
    text.text = [NSString stringWithFormat:@"%@%C", text.text, 'L'];
}

- (IBAction)ClearText:(id)sender 
{
    text.text = @"";
}


- (IBAction)SendPlainText:(id)sender 
{
    {
        NSString *jsonRequest = @"{\"encryption\":\"off\",\"msgFrom\":\"oscber6867@gmail.com\",\"msgTo\":\"jesposito61@gmail.com\",\"message\":\"ENIGMA\",\"rotors\":[{\"rclass\":\"rotor\",\"rtype\":\"I\",\"slot\":\"1\",\"start\":\"A\"},{\"rclass\":\"rotor\",\"rtype\":\"II\",\"slot\":\"2\",\"start\":\"A\"},{\"rclass\":\"rotor\",\"rtype\":\"III\",\"slot\":\"3\",\"start\":\"A\"},{\"rclass\":\"reflector\",\"rtype\":\"B\",\"slot\":\"4\",\"start\":\"A\"}],\"plugboard\":[{\"from\":\"A\",\"to\":\"Z\"},{\"from\":\"B\",\"to\":\"Y\"},{\"from\":\"C\",\"to\":\"X\"},{\"from\":\"D\",\"to\":\"W\"},{\"from\":\"E\",\"to\":\"V\"}]}";
        
        NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
        NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.koinoniasgr.com/enigma/Encrypt"]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:requestData];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%d",[requestData length]] forHTTPHeaderField:@"Content-Length"];
        
        NSURLResponse *response;  
        NSError *err;  
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];  
        
        NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]; 
        
        NSLog(@"responseData: %@", jsonString);  
        
    }

}

-(IBAction)SendText:(id)sender
{
    NSString *jsonRequest = @"{\"encryption\":\"on\",\"msgFrom\":\"oscber6867@gmail.com\",\"msgTo\":\"jesposito61@gmail.com\",\"message\":\"ENIGMA\",\"rotors\":[{\"rclass\":\"rotor\",\"rtype\":\"I\",\"slot\":\"1\",\"start\":\"A\"},{\"rclass\":\"rotor\",\"rtype\":\"II\",\"slot\":\"2\",\"start\":\"A\"},{\"rclass\":\"rotor\",\"rtype\":\"III\",\"slot\":\"3\",\"start\":\"A\"},{\"rclass\":\"reflector\",\"rtype\":\"B\",\"slot\":\"4\",\"start\":\"A\"}],\"plugboard\":[{\"from\":\"A\",\"to\":\"Z\"},{\"from\":\"B\",\"to\":\"Y\"},{\"from\":\"C\",\"to\":\"X\"},{\"from\":\"D\",\"to\":\"W\"},{\"from\":\"E\",\"to\":\"V\"}]}";
    
    NSLog(@"%@", jsonRequest);
    
    NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
    
  //  NSError *writeError = nil;
  //  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:kNilOptions error:&writeError];
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.koinoniasgr.com/enigma/Encrypt"]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    NSURLResponse *response = NULL;
    NSError *requestError = NULL;
    //NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    requestData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
 /*   
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:requestData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d",[requestData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSURLResponse *response;  
    NSError *err; 
  
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];  
  */
    NSString *jsonString = [[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding]; 

    
    NSLog(@"responseData: %@", jsonString);     
}
@end
