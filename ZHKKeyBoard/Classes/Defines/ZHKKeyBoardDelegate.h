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

- (void)keyboard:(id <ZHKKeyBoardView>)keyBoard inputWord:(NSString *)word replace:(BOOL)replace;

- (void)deleteBackward;

- (void)keyBoardHidded;

@end
