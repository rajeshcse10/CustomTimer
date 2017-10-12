//
//  SHTimer.h
//  MyCustomDispatchTimer
//
//  Created by MacBook Pro Retina on 10/12/17.
//  Copyright © 2017 MacBook Pro Retina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHTimer : NSObject
-(id)init;
-(void)startTimerWithInterval:(double) interval WithTask:(void(^)(void))task;
-(void) stopTimer;
@end
