//
//  MOHomeViewController.h
//  00.OCDemo
//
//  Created by 莫晓卉 on 2020/7/11.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOHomeViewController : UIViewController

@property (nonatomic, readonly, copy) NSString *indentify;

@end

NS_ASSUME_NONNULL_END

// - 7大类别Categorys: 
// SoloAmbient: 仅播放, 会中断其他播放, 锁屏/静音会静音. 如: 节奏大师
// Ambient: 可与音乐同时播放, 锁屏/静音会静音. 如: 背景音乐
// Record: 录音时中断其他播放, 如: 微信长按录音
// PlayAndRecord: 播放+录制. 如: 打电话
// Playback: 锁屏/静音 继续播放, 会暂停其他App的播放
// MultiRoute: 可以支持多个设备输入输出. 如: 扬声器播放一个音频，耳机播放另一个
// AudioProcessing: 音频格式处理，一般可以配合AudioUnit进行使用.

// - 7种基调Options: | (或运算, 可以设置多个) availableCategories
// MinWithOthers: PlayAndRecord/Playback/MultiRoute 是否可以和其他后台App进行混音
// DuckOthers: Ambient/PlayAndRecord/Playback/MultiRoute 是否压低其App声音
// AllowBluetooth: Record/PlayAndRecord 是否支持蓝牙耳机
// DefaultToSpeaker: PlayAndRecord 是否默认用免提声音
// InterruptSpokenAudioAndMixWithOthers: iOS9 --
// AllowBluetoothA2DP: iOS10 --
// AllowAirPlay: iOS10 -- 支持蓝牙/A2DP耳机/AirPlay

// 7大模式Modes: availableModes
// Default: 所有Category 默认场景
// VoiceChat: PlayAndRecord VoIP?
// GameChat: PlayAndRecord 游戏录制, 由GKVoiceChat自动设置, 无需手动调用
// VideoRecording: Record/PlayAndRecord 录制视频时
// Measurement: Record/PlayAndRecord/Playback 最小系统
// MoviePlayback: Playback 视频播放
// VideoChat: PlayAndRecord 视频通话
// SpokenAudio:
//- (BOOL)setMode:(NSString *)mode error:(NSError **)outError;
//- (BOOL)setCategory:(NSString *)category mode:(NSString *)mode options:(AVAudioSessionCategoryOptions)options error:(NSError **)outError;


// 被打断通知: AVAudioSessionInterruptionNotification
// key: AVAudioSessionInterruptionTypeKey
// values:
// AVAudioSessionInterruptionTypeBegan
// AVAudioSessionInterruptionTypeEnded

// key: AVAudioSessionInterruptionOptionKey
// value: AVAudioSessionInterruptionOptionShouldResume

// 设备改变: AVAudioSessionRouteChangeNotification
// key: Key
// key: AVAudioSessionSilenceSecondaryAudioHintTypeKey
// Unknown  未知原因
// NewDeviceAvailable  有新设备可用
// OldDeviceUnavailable  老设备不可用
// CategoryChange  类别改变了
// Override  App重置了输出设置
// WakeFromSleep  从睡眠状态呼醒
// NoSuitableRouteForCategory  当前Category下没有合适的设备
// RouteConfigurationChange  Rotuer的配置改变了

// 参考: https://www.sunyazhou.com/2018/01/12/20180112AVAudioSession-Category/
