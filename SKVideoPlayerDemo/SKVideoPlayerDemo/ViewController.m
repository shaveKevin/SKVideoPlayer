//
//  ViewController.m
//  SKVideoPlayerDemo
//
//  Created by shavekevin on 2019/7/9.
//  Copyright © 2019 shavekevin. All rights reserved.
//

#import "ViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface ViewController ()
/** 播放属性 */
@property (nonatomic, strong) id<IJKMediaPlayback>     player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    [options setOptionIntValue:IJK_AVDISCARD_DEFAULT forKey:@"skip_frame" ofCategory:kIJKFFOptionCategoryCodec];
    [options setOptionIntValue:IJK_AVDISCARD_DEFAULT forKey:@"skip_loop_filter" ofCategory:kIJKFFOptionCategoryCodec];
    [options setOptionIntValue:1 forKey:@"videotoolbox" ofCategory:kIJKFFOptionCategoryPlayer];
    [options setOptionIntValue:30 forKey:@"max-fps" ofCategory:kIJKFFOptionCategoryPlayer];
    [options setPlayerOptionIntValue:256 forKey:@"vol"];
    [options setFormatOptionIntValue:1 forKey:@"reconnect"];
    [options setFormatOptionIntValue:30 *1000 * 1000 forKey: @"timeout"];
    
    // Do any additional setup after loading the view.
    self.player = [[IJKFFMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:@"http://txmov2.a.yximgs.com/bs2/newWatermark/MTQwMDQ2NTk1NjE_zh_4.mp4"] withOptions:options];
    [self.player setScalingMode:IJKMPMovieScalingModeAspectFill];
    self.player.shouldAutoplay = YES;
    self.player.view.frame = CGRectMake(0, 100, CGRectGetWidth([UIScreen mainScreen].bounds), 200);
    [self.view addSubview:self.player.view];
    [self.player prepareToPlay];
    self.player.view.backgroundColor = [UIColor redColor];
    [self.player play];

}


@end
