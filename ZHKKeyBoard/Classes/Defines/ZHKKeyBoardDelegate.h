//
//  ZHKKeyBoardDelegate.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import <Foundation/Foundation.h>
#import "ZHKKeyBoardView.h"

@protocol ZHKKeyBoardDelegate <NSObject>

/// 键盘输入文本内容
/// @param keyBoard 键盘视图对象
/// @param word     输入文本
/// @param replace  是否替换历史文本
- (void)keyboard:(id <ZHKKeyBoardView>)keyBoard inputWord:(NSString *)word replace:(BOOL)replace;

/// 键盘输入对象
/// @param keyBoard 键盘视图对象
/// @param object   输入对象 (NSString, NSArray<NSString *>, NSDate 等)
- (void)keyboard:(id <ZHKKeyBoardView>)keyBoard inputObject:(NSObject *)object;

/// 删除按钮点击事件
- (void)deleteBackward;

/// 隐藏键盘
- (void)keyBoardHidded;

@end
