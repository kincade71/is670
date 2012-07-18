//
//  Rotor.m
//  enigmaMachine
//
//  Created by Jim Esposito on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Rotor.h"

@implementation Rotor

@synthesize slot=_slot;
@synthesize start=_start;
@synthesize rtype=_rtype;
@synthesize rclass=_rclass;

-(id)initWithSlot:(NSString*)slot
            start:(NSString*)start
            rtype:(NSString*)rtype
           rclass:(NSString*)rclass
{
    _slot=slot;
    _start=start;
    _rtype=rtype;
    _rclass=rclass;
    return self;
}
@end
