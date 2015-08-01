//
//  ViewController.m
//  SwingShip
//
//  Created by admin on 8/1/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView* ship;
    UIImageView* sea1 , *sea2, *sea3 ,*sea4;
    AVAudioPlayer* player,* player1;
    int k;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawShipAndSea];
    [self animateShip];
    [self animateSea];
    NSURL* sound = [[NSBundle mainBundle] URLForResource:@"MySong" withExtension:@"mp3"];
    NSURL* sound1 = [[NSBundle mainBundle] URLForResource:@"MySong1" withExtension:@"mp3"];
    [self playSong:sound andURL2:sound1];
}

- (void) drawShipAndSea{
    sea1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea1.png"]];
    sea1.frame = self.view.bounds;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea2.png"]];
    sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
    
    sea3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea3.png"]];
    sea3.frame = CGRectMake(2*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea3];
    
    sea4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea4.png"]];
    sea4.frame = CGRectMake(3*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea4];
    
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship128.png"]];
    ship.center = CGPointMake(200, 500);
    [self.view addSubview:ship];
}

- (void) animateShip{
    [UIView animateWithDuration:1 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.05);
    }completion:^(BOOL finished){
        [UIView animateWithDuration:1
                         animations:^{
                             ship.transform = CGAffineTransformMakeRotation(0.05);
                         }completion:^(BOOL finished){
                             [self animateShip];
                         }];
    }];
}

- (void) animateSea {
    [UIView animateWithDuration:10
                     animations:^{
                         sea1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         sea2.frame = self.view.bounds;
                         sea3.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         sea4.frame = CGRectMake(2*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                     }completion:^(BOOL finished){
                         sea1.frame = CGRectMake(3*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         [UIView animateWithDuration:10 animations:^{
                             sea3.frame = self.view.bounds;
                             sea2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             sea4.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             sea1.frame = CGRectMake(2*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         }completion:^(BOOL finished){
                             sea2.frame = CGRectMake(3*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             [UIView animateWithDuration:10 animations:^{
                                 sea4.frame = self.view.bounds;
                                 sea3.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                 sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                 sea2.frame = CGRectMake(2*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             }completion:^(BOOL finishes){
                                 sea3.frame = CGRectMake(3*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                 [UIView animateWithDuration:10 animations:^{
                                     sea1.frame = self.view.bounds;
                                     sea4.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                     sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                     sea3.frame = CGRectMake(2*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                 }completion:^(BOOL finished){
                                     sea4.frame = CGRectMake(3*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                     [self animateSea];
                                 }];
                             }];
                         }];
                     }];
}

- (void) playSong:(NSURL*) url andURL2:(NSURL*) url2{
    //NSString* filePath = [[NSBundle mainBundle] pathForResource:@"MySong" ofType:@"mp3"];
    //NSURL* url = [NSURL fileURLWithPath:filePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:nil];
    player.numberOfLoops = -1;
    player1.numberOfLoops = -1;
    [player prepareToPlay];
    [player1 prepareToPlay];
    [player play];
    [player1 play];
}

//- (void) viewDidAppear:(BOOL)animated {
   // [player stop];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
