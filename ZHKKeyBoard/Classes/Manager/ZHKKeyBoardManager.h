//
//  ZHKKeyBoardManager.h
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2018/7/30.
//

#import <Foundation/Foundation.h>
#import "ZHKKeyBoardDefine.h"
#import "ZHKTextInput.h"

@interface ZHKKeyBoardManager : NSObject

+ (instancetype)managerWithTarget:(id <ZHKTextInput>)target;

- (UIView *)keyboardWithType:(ZHKKeyBoardType)type;

@end
