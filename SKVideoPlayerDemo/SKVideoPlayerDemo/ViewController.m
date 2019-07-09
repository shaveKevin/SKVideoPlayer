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
    self.player = [[IJKFFMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:@"http://video.klm123.com/021dd1be8ca946ce8a0f6b98cee45c81/a582b3c9c7a04401803b57470aea8a0b_10.mp4?auth_key=1562676347-d16dddffe7904bcf8758c605a3fe880a-0-4a08b51f0fd52a04811bb9c0913a1075"] withOptions:options];
    [self.player setScalingMode:IJKMPMovieScalingModeAspectFill];
    self.player.shouldAutoplay = YES;
    self.player.view.frame = CGRectMake(0, 100, CGRectGetWidth([UIScreen mainScreen].bounds), 200);
    [self.view addSubview:self.player.view];
    [self.player prepareToPlay];
    self.player.view.backgroundColor = [UIColor redColor];
    [self.player play];

}


@end
