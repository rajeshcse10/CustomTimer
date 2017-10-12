//
//  SHTimer.m
//  MyCustomDispatchTimer
//
//  Created by MacBook Pro Retina on 10/12/17.
//  Copyright © 2017 MacBook Pro Retina. All rights reserved.
//

#import "SHTimer.h"

@implementation SHTimer{
    dispatch_source_t timer;
}
-(id)init{
    self = [super init];
    if(self){
        timer = nil;
    }
    return self;
}
-(void) configureTimerWithInterval:(double) interval{
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, 0);
    uint64_t intervalTime = (int64_t)(interval * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, startTime, intervalTime, 0);
    
}
-(void)startTimerWithInterval:(double) interval WithTask:(void(^)(void))task{
    if(timer == nil){
        [self configureTimerWithInterval:interval];
        dispatch_source_set_event_handler(timer, ^{
            task();
        });
        dispatch_resume(timer);
    }
}
-(void) stopTimer{
    if(timer == nil) return;
    dispatch_source_cancel(timer);
    timer = nil;
}
@end
