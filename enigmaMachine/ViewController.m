//
//  ViewController.m
//  enigmaMachine
//
//  Created by Oscar Bernal on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *rotor1 = [defaults objectForKey:@"rotor1"];
    NSString *rotor2 = [defaults objectForKey:@"rotor2"];
    NSString *rotor3 = [defaults objectForKey:@"rotor3"];
    NSString *reflect = [defaults objectForKey:@"reflect"];
    NSString *Plug = [defaults objectForKey:@"plug"];
    
    rotorI.text = rotor1;
    rotorII.text = rotor2;
    rotorIII.text = rotor3;
    reflector.text = reflect;
    plug.text = Plug;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    rotorIArray = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    reflectorArray = [[NSArray alloc] initWithObjects:@"B",@"C", nil];
    
    plug.delegate = self;
    
    rotorAlpha1.delegate = self;
    rotorAlpha2.delegate = self;
    rotorAlpha3.delegate = self;
    reflectorPick.delegate = self;
    
    
}

- (void)viewDidUnload
{
    SaveButton = nil;
    plug = nil;
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
    
    
    NSString *rotor1 = [rotorI text];
    NSString *rotor2 = [rotorII text];
    NSString *rotor3 = [rotorIII text];
    NSString *reflect = [reflector text];
    NSString *Plug = [plug text];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:rotor1 forKey:@"rotor1"];
    [defaults setObject:rotor2 forKey:@"rotor2"];
    [defaults setObject:rotor3 forKey:@"rotor3"];
    [defaults setObject:reflect forKey:@"reflect"];
    [defaults setObject:Plug forKey:@"plug"];
    
    [defaults synchronize];
    
    NSLog(@"Data saved");
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {	
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationBeginsFromCurrentState:YES];
	plug.frame = CGRectMake(plug.frame.origin.x, (plug.frame.origin.y - 130.0), plug.frame.size.width, plug.frame.size.height);
	[UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {	
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationBeginsFromCurrentState:YES];
	plug.frame = CGRectMake(plug.frame.origin.x, (plug.frame.origin.y + 130.0), plug.frame.size.width, plug.frame.size.height);
	[UIView commitAnimations];
}

- (IBAction)ReturnButton:(id)sender
{
    [plug resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[plug resignFirstResponder];
}

@end
