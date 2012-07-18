//
//  ViewController.m
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;
CGFloat animatedDistance;
UITextField *currentTextField;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    // NSString *Plug = [defaults objectForKey:@"plug"];
    
    [rotorI setText:[defaults objectForKey:@"rotor1"]];
    [rotorII setText:[defaults objectForKey:@"rotor2"]];
    [rotorIII setText:[defaults objectForKey:@"rotor3"]];
    [reflector setText:[defaults objectForKey:@"reflect"]];
    [rotorType1 setText:[defaults objectForKey:@"rotoType1"]];
    [rotorType2 setText:[defaults objectForKey:@"rotoType2"]];
    [rotorType3 setText:[defaults objectForKey:@"rotoType3"]];
    
    [plug setText:[defaults objectForKey:@"plug"]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    rotorIArray = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    reflectorArray = [[NSArray alloc] initWithObjects:@"B",@"C", nil];
    
    plug.delegate = self;
    
    rotorAlpha1.delegate = self;
    rotorAlpha2.delegate = self;
    rotorAlpha3.delegate = self;
    reflectorPick.delegate = self;
    rotorType1.delegate = self;
    rotorType2.delegate = self;
    rotorType3.delegate = self;
    
}

- (void)viewDidUnload
{
    SaveButton = nil;
    plug = nil;
    [rotorType1 release];
    rotorType1 = nil;
    [rotorType2 release];
    rotorType2 = nil;
    [rotorType3 release];
    rotorType3 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (reflectorPick == pickerView) 
    {
        return [reflectorArray count];
    }
    else 
    {
        return [rotorIArray count];
    }
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (reflectorPick == pickerView) 
    {
        reflector.text = [reflectorArray objectAtIndex:row];
    }
    else
    {
        if(rotorAlpha1 == pickerView)
        {
            rotorI.text = [rotorIArray objectAtIndex:row];
        }
        else
        {
            if (rotorAlpha2 == pickerView)
            {
                rotorII.text =[rotorIArray objectAtIndex:row];
            }
            else {
                if (rotorAlpha3 == pickerView) 
                {
                    rotorIII.text = [rotorIArray objectAtIndex:row];
                }
            }
        }
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (reflectorPick == pickerView)
    {
        return [reflectorArray objectAtIndex:row];
    }
    else
    {
        return [rotorIArray objectAtIndex:row];
    }
}


- (IBAction)SaveInfo:(id)sender 
{
    
    [rotorI resignFirstResponder];
    [rotorII resignFirstResponder];
    [rotorIII resignFirstResponder];
    [reflector resignFirstResponder];
    [plug resignFirstResponder];
    [rotorAlpha1 resignFirstResponder];
    [rotorAlpha2 resignFirstResponder];
    [rotorAlpha3 resignFirstResponder];
    
    [rotorType1 resignFirstResponder];
    [rotorType2 resignFirstResponder];
    [rotorType3 resignFirstResponder];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[rotorI text]forKey:@"rotor1"];
    [defaults setObject:[rotorII text]forKey:@"rotor2"];
    [defaults setObject:[rotorIII text]forKey:@"rotor3"];
    [defaults setObject:[reflector text] forKey:@"reflect"];
    [defaults setObject:[rotorType1 text]forKey:@"rotoType1"];
    [defaults setObject:[rotorType2 text]forKey:@"rotoType2"];
    [defaults setObject:[rotorType3 text]forKey:@"rotoType3"];
    
    [defaults setObject:[plug text]forKey:@"plug"];
    
    [defaults synchronize];
    
    NSLog(@"Data saved");
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    currentTextField = textField;
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline=0;
    if ([self interfaceOrientation] == UIInterfaceOrientationPortrait)
    {
        midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    }
    else if ([self interfaceOrientation] == UIInterfaceOrientationLandscapeLeft)
    {
        midline = textFieldRect.origin.x + 0.5 * textFieldRect.size.width;
    }
    else if ([self interfaceOrientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
        midline = (viewRect.size.height - textFieldRect.size.height - textFieldRect.origin.y) + 0.5 * textFieldRect.size.height;
    }
    else if ([self interfaceOrientation] == UIInterfaceOrientationLandscapeRight)
    {
        midline = (viewRect.size.width - textFieldRect.size.width - textFieldRect.origin.x) + 0.5 * textFieldRect.size.width;
    }
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)ReturnButton:(id)sender
{
    [plug resignFirstResponder];
    [rotorType1 resignFirstResponder];
    [rotorType2 resignFirstResponder];
    [rotorType3 resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[rotorType1 resignFirstResponder];
    [rotorType2 resignFirstResponder];
    [rotorType3 resignFirstResponder];
    [plug resignFirstResponder];
}

-(IBAction)getData
{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *rot1 = [prefs stringForKey:@"rotor1"];
    
    NSString *rot2 = [prefs stringForKey:@"rotor2"];
    
    NSString *rot3 = [prefs stringForKey:@"rotor3"];
    
    NSString *reflector = [prefs stringForKey:@"reflect"];
    
    NSString *rotorT1 = [prefs stringForKey:@"rotType1"];
    
    NSString *rotorT2 = [prefs stringForKey:@"rotType2"];
    
    NSString *rotorT3 = [prefs stringForKey:@"rotType3"];
    
}



- (void)dealloc {
    [rotorType1 release];
    [rotorType2 release];
    [rotorType3 release];
    [super dealloc];
}
@end
