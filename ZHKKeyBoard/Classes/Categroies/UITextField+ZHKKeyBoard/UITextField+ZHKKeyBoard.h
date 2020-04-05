//
//  UITextField+ZHKKeyBoard.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import "ZHKKeyBoardDefine.h"
#import "ZHKTextInput.h"

@interface UITextField (ZHKKeyBoard) <ZHKTextInput>

@property (nonatomic, assign) ZHKKeyBoardType zhk_keyboardType;
@property (nonatomic, strong) NSDate *zhk_date;     // 日期对象
@property (nonatomic, strong) NSString *zhk_dateFormat; // 日期格式化

// Block 容器对象
@property (nonatomic, strong, readonly) ZHKBlockObject *keyboardBlockObject;

/// 设置输入对象回调
/// @param block 回调键盘输入的对象: NSDate, NSString, NSArray 等
- (void)setKeyboardBlock:(void(^)(id object))block;

@end
