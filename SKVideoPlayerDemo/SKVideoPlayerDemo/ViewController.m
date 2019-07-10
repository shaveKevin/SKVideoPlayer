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
    
    NSArray *array = @[@"http://txmov2.a.yximgs.com/upic/2019/07/09/19/BMjAxOTA3MDkxOTAyMzRfMTM3MTIxNDU4M18xNDk4MDA5MjYxMF8xXzM=_b_Bf1eae3107d295c501c17f916a6641113.mp4",
                       @"http://txmov2.a.yximgs.com/upic/2019/07/08/08/BMjAxOTA3MDgwODQ1MTlfMTE1ODExNDY2MV8xNDkxOTU4ODAzN18xXzM=_b_Bb3d9ed32ff83f931bd67941b09dc6382.mp4"];
    // Do any additional setup after loading the view.
    self.player = [[IJKFFMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:array[1]] withOptions:options];
    [self.player setScalingMode:IJKMPMovieScalingModeAspectFill];//缩放模式
    self.player.shouldAutoplay = NO;// 自动播放
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.player.view.frame = self.view.bounds;
    [self.view addSubview:self.player.view];
    self.player.view.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(play)];
    [self.player.view addGestureRecognizer:tap];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.player prepareToPlay];
}

- (void)play {
    
    if ([self.player isPlaying]) {
        [self.player stop];
    }
    [self.player play];
    
}

@end
