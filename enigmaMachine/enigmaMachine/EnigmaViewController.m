//
//  EnigmaViewController.m
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EnigmaViewController.h"
#import "ViewController.h"
#import "MessageViewController.h"
#import "Rotor.h"
#import "Plugboard.h"
#import "RotorPositions.h"
#import "EncryptionPath.h"

NSString *rot1;
NSString *rot2;
NSString *rot3;
NSString *reflector;
NSString *rotorT1;
NSString *rotorT2;
NSString *rotorT3; 
NSString *plug;
NSMutableArray *pArray;
NSString *encryptedString;
NSMutableArray *endPositionsArray;
NSMutableArray *encryptionPathArray;
NSMutableArray *lettersArray;
NSMutableArray *encryptionDataArray;


@interface EnigmaViewController ()

@end

NSString *encryption;
NSString *msgFrom;
NSString *msgTo;
NSString *message;
NSMutableArray *rotorArray;
NSMutableArray *plugboardArray;

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
- (void)viewDidAppear:(BOOL)animated
{
    [self getData];
    
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
   
  
    RetrieveButton = nil;
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
    NSData *jsonData = [self CreateJSONRequestEncrypt:@"off"];
    
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.koinoniasgr.com/enigma/Encrypt/"]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d",[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSURLResponse *response;  
    NSError *err;  
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];  
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]; 
    NSLog(@"responseData: %@", responseString); 
    [self parseJSONResults:responseData Encrypted:NO];
    [text setText:encryptedString];
}


-(IBAction)SendText:(id)sender
{
    NSData *jsonData = [self CreateJSONRequestEncrypt:@"on"];
    
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.koinoniasgr.com/enigma/Encrypt/"]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d",[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSURLResponse *response;  
    NSError *err;  
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];  
    
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]; 
    NSLog(@"responseData: %@", responseString);  
    [self parseJSONResults:responseData Encrypted:YES];
    [text setText:encryptedString];
}

- (IBAction)RetrieveMessage:(id)sender 
{
    MessageViewController * message = [[MessageViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:message animated:YES];
}

- (void)AddNewRotorDictionaryToArrayWithClass:(NSString *)class Type:(NSString *)rotorType Slot:(NSString *)slot StartingPosition:(NSString *)start
{
    Rotor *newRotor = [[Rotor alloc]initWithSlot:slot start:start rtype:rotorType rclass:class];
    NSDictionary *rotor = [NSDictionary dictionaryWithObjectsAndKeys:newRotor.slot,@"slot",newRotor.start,@"start",newRotor.rtype,@"rtype",newRotor.rclass,@"rclass", nil];
    [rotorArray addObject:rotor];
}

- (void)AddNewPlugboardDictionaryToArrayWithFrom:(NSString *)from To:(NSString *)to
{
    Plugboard *newPlugboardsetting = [[Plugboard alloc]initWithFrom:from to:to];
    NSDictionary *pboard = [NSDictionary dictionaryWithObjectsAndKeys:newPlugboardsetting.from,@"from",newPlugboardsetting.to,@"to", nil];;
    [plugboardArray addObject:pboard];
}

- (NSData *)CreateJSONRequestEncrypt:(NSString*)encryption
{
    //encryption = [NSString stringWithFormat:encryption];
    msgFrom = [NSString stringWithFormat:@"oscber6867@gmail.com"];
    msgTo = [NSString stringWithFormat:@"jesposito61@gmail.com"];
    message = [NSString stringWithFormat:text.text];
    
    //initialize plugboard and rotor arrays
    rotorArray = [[NSMutableArray alloc]init];
    plugboardArray = [[NSMutableArray alloc]init];
    
    //define rotors, create dictionary from rotor, add dictionary to rotorArray
    [self AddNewRotorDictionaryToArrayWithClass:@"rotor" Type:rotorT1 Slot:@"1" StartingPosition:rot1];
    [self AddNewRotorDictionaryToArrayWithClass:@"rotor" Type:rotorT2 Slot:@"2" StartingPosition:rot2];
    [self AddNewRotorDictionaryToArrayWithClass:@"rotor" Type:rotorT3 Slot:@"3" StartingPosition:rot3];
    [self AddNewRotorDictionaryToArrayWithClass:@"reflector" Type:reflector Slot:@"4" StartingPosition:@"A"];
    for(Plugboard *p in pArray){
        [self AddNewPlugboardDictionaryToArrayWithFrom:p.from To:p.to];
    }
    /*
    [self AddNewPlugboardDictionaryToArrayWithFrom:@"A" To:@"Z"];
    [self AddNewPlugboardDictionaryToArrayWithFrom:@"B" To:@"Y"];
    [self AddNewPlugboardDictionaryToArrayWithFrom:@"C" To:@"X"];
    [self AddNewPlugboardDictionaryToArrayWithFrom:@"D" To:@"W"];
    [self AddNewPlugboardDictionaryToArrayWithFrom:@"E" To:@"V"];*/
    NSDictionary *rotorDictionary;
    
    if ([plugboardArray count] == 0) {
        rotorDictionary = [NSDictionary dictionaryWithObjectsAndKeys:encryption,@"encryption", msgFrom, @"msgFrom", msgTo, @"msgTo", message, @"message", rotorArray, @"rotors", nil];
    }else {
        rotorDictionary = [NSDictionary dictionaryWithObjectsAndKeys:encryption,@"encryption", msgFrom, @"msgFrom", msgTo, @"msgTo", message, @"message", rotorArray, @"rotors", plugboardArray, @"plugboard", nil];
    }
    
    NSData *jsonRequest = [NSJSONSerialization dataWithJSONObject:rotorDictionary options:kNilOptions error:nil];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonRequest encoding:NSUTF8StringEncoding]; 
    NSLog(@"requestData: %@", jsonString);
    
    return jsonRequest;
    
}

-(void)getData
{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    rot1 = [prefs stringForKey:@"rotor1"];
    
    rot2 = [prefs stringForKey:@"rotor2"];
    
    rot3 = [prefs stringForKey:@"rotor3"];
    
    reflector = [prefs stringForKey:@"reflect"];
    
    rotorT1 = [prefs stringForKey:@"rotoType1"];
    
    rotorT2 = [prefs stringForKey:@"rotoType2"];
    
    rotorT3 = [prefs stringForKey:@"rotoType3"];
    
    plug = [prefs stringForKey:@"plug"];
    
    NSArray *stringArray = [plug componentsSeparatedByString: @","];
    
    pArray =[[NSMutableArray alloc] init];
    
    for (int i =0; i < [stringArray count]; i++) {
        NSArray *plugA = [[stringArray objectAtIndex:i] componentsSeparatedByString: @":"];
        if ([plugA count]< 2) 
        {
            break;
        }
        Plugboard *p = [[Plugboard alloc] init ];
        p.from = [plugA objectAtIndex:0];
        p.to = [plugA objectAtIndex:1];
        [pArray addObject:p];
    }
    
}

- (void)parseJSONResults:(NSData*)jsonData
               Encrypted:(BOOL)encrypted{
    lettersArray = [[NSMutableArray alloc]init];
    endPositionsArray = [[NSMutableArray alloc]init];
    if(jsonData != nil)
    {
        NSError *error = nil;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error==nil)
        {
            encryptedString = [result objectForKey:@"encryptedMessage"];
            if (encrypted) {
                NSArray *positionsDictionary = [result objectForKey:@"endingPositions"];
                if (positionsDictionary != Nil && [positionsDictionary isKindOfClass:[NSArray class]])
                {
                    NSLog(@"Got it");
                }
                NSDictionary *entry;
                for(int i=0;i<[positionsDictionary count];i++)
                {
                    entry = [positionsDictionary objectAtIndex:i];
                    RotorPositions *rp = [[RotorPositions alloc]initWithSlot:[entry objectForKey:@"slot"] position:[entry objectForKey:@"end"]];
                    [endPositionsArray addObject:rp];
                }
                
                NSArray *lettersDictionary = [result objectForKey:@"letters"];
                NSDictionary *ePath;
                NSArray *entries;
                for(int i=0;i<[lettersDictionary count];i++)
                {
                    ePath = [lettersDictionary objectAtIndex:i];
                    entries = [ePath objectForKey:@"encryptionPath"];
                    encryptionPathArray = [[NSMutableArray alloc]init];
                    for(int j=0;j<[entries count];j++)
                    {
                        NSDictionary *entry = [entries objectAtIndex:j];
                        EncryptionPath *ep = [[EncryptionPath alloc]initWithFrom:[entry objectForKey:@"From"] to:[entry objectForKey:@"To"]];
                        [encryptionPathArray addObject:ep];
                    }
                    [lettersArray addObject:encryptionPathArray];
                }
            }
            
            // Test results
            //NSLog(@"Encrypted Message: %@",encryptedString);
            //RotorPositions *rp = [[RotorPositions alloc]init];
            //for(int i=0;i<[endPositionsArray count];i++)
            //{
            //    rp = [endPositionsArray objectAtIndex:i];
            //    NSLog(@"Slot %d ends in position %@",i+1,rp.position);
            //}
            //for(int i=0;i<[lettersArray count];i++)
            //{
            //    NSLog(@"Letter conversion path");
            //    NSMutableArray *tmpArray = [lettersArray objectAtIndex:i];
            //    EncryptionPath *ep = [[EncryptionPath alloc]init];
            //    for(int j=0;j<[tmpArray count];j++)
            //    {
            //        ep = [tmpArray objectAtIndex:j];
            //        NSLog(@"  conversion step %d: %@->%@",j+1,ep.from,ep.to);
            //    }
            //    NSLog(@"----------------------");
            //}
            
        } 
        else 
        {
            NSLog(@"Error getting result");
        }
    }
    else
    {
        NSLog(@"Error setting data");
    }
}


@end
