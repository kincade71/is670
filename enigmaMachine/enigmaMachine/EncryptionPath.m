//
//  EncryptionPath.m
//  enigmaMachine
//
//  Created by Jim Esposito on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EncryptionPath.h"

@implementation EncryptionPath

@synthesize from=_from;
@synthesize to=_to;

-(id)initWithFrom:(NSString*)from
            to:(NSString*)to
{
    _from=from;
    _to=to;
    return self;
}
@end
