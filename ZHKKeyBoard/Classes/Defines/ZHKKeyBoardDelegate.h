//
//  ZHKKeyBoardDelegate.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import <Foundation/Foundation.h>
#import "ZHKKeyBoard.h"

@protocol ZHKKeyBoardDelegate <NSObject>

- (void)keyboard:(id <ZHKKeyBoard>)keyBoard inputWord:(NSString *)word;

- (void)deleteBackward;

@end
