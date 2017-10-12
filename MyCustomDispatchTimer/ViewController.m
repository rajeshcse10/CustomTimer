//
//  ViewController.m
//  MyCustomDispatchTimer
//
//  Created by MacBook Pro Retina on 10/12/17.
//  Copyright © 2017 MacBook Pro Retina. All rights reserved.
//

#import "ViewController.h"
#import "SHTimer.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation ViewController{
    SHTimer *mTimer;
    int counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    counter = 0;
    self.counterLabel.text = @"0";
    mTimer = [[SHTimer alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startAction:(id)sender {
    [mTimer startTimerWithInterval:1.0 WithTask:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.counterLabel.text = [NSString stringWithFormat:@"%d",counter++];
        });
    }];
}
- (IBAction)stopAction:(id)sender {
    [mTimer stopTimer];
}


@end
