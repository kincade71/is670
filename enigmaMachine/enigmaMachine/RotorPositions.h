//
//  RotorPositions.h
//  enigmaMachine
//
//  Created by Jim Esposito on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RotorPositions : NSObject

@property (nonatomic, retain) NSString *slot;
@property (nonatomic, retain) NSString *position;

-(id)initWithSlot:(NSString*)slot
         position:(NSString*)position;
@end
