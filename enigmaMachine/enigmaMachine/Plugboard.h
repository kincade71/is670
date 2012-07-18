//
//  Plugboard.h
//  enigmaMachine
//
//  Created by Jim Esposito on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plugboard : NSObject

@property (nonatomic, retain) NSString *from;
@property (nonatomic, retain) NSString *to;

-(id)initWithFrom:(NSString*)from
               to:(NSString*)to;
@end
