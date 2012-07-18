//
//  RotorPositions.m
//  enigmaMachine
//
//  Created by Jim Esposito on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RotorPositions.h"

@implementation RotorPositions

@synthesize slot=_slot;
@synthesize position=_position;

-(id)initWithSlot:(NSString*)slot
         position:(NSString*)position
{
    _slot=slot;
    _position=position;
     return self;
}
@end
