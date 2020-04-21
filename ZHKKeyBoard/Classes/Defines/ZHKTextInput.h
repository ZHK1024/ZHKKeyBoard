//
//  ZHKIputTarget.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import <UIKit/UIKit.h>
#import "ZHKBlockObject.h"
#import "ZHKSelectionModels.h"

@protocol ZHKTextInput <UITextInput>

@property (nonatomic, strong) UIView *inputView;
// Block 容器对象
@property (nonatomic, strong, readonly) ZHKBlockObject *keyboardBlockObject;
@property (nonatomic, strong) id <ZHKSelectionInfo> selectionInfo;
/// 设置输入对象回调
/// @param block 回调键盘输入的对象: NSDate, NSString, NSArray 等
- (void)setKeyboardBlock:(void(^)(id object))block;

@end
