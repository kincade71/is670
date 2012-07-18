//
//  Rotor.h
//  enigmaMachine
//
//  Created by Jim Esposito on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rotor : NSObject

@property (nonatomic, retain) NSString *rclass;
@property (nonatomic, retain) NSString *rtype;
@property (nonatomic, retain) NSString *slot;
@property (nonatomic, retain) NSString *start;

-(id)initWithSlot:(NSString*)slot
            start:(NSString*)start
            rtype:(NSString*)rtype
           rclass:(NSString*)rclass;
@end
