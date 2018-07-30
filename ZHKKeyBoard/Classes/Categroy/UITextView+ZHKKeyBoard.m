//
//  UITextView+ZHKKeyBoard.m
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import "UITextView+ZHKKeyBoard.h"
#import <objc/runtime.h>
#import "ZHKKeyBoardManager.h"

static char *zhk_keyboardTypeKey_UITextView = "zhk_keyboardTypeKey_UITextView";
static char *zhk_keyboardManager_UITextView = "zhk_keyboardManager_UITextView";

@interface UITextView ()

@property (nonatomic, strong, readonly) ZHKKeyBoardManager *zhk_keyboardManager;

@end

@implementation UITextView (ZHKKeyBoard)

- (void)setZhk_keyboardType:(ZHKKeyBoardType)zhk_keyboardType {
    objc_setAssociatedObject(self, zhk_keyboardTypeKey_UITextView, @(zhk_keyboardType), OBJC_ASSOCIATION_RETAIN);
    self.inputView = [self.zhk_keyboardManager keyboardWithType:zhk_keyboardType];
}

- (ZHKKeyBoardType)zhk_keyboardType {
    NSNumber *type = objc_getAssociatedObject(self, zhk_keyboardTypeKey_UITextView);
    return type.integerValue;
}

- (ZHKKeyBoardManager *)zhk_keyboardManager {
    ZHKKeyBoardManager *manager = objc_getAssociatedObject(self, zhk_keyboardManager_UITextView);
    if (manager == nil) {
        manager = [ZHKKeyBoardManager managerWithTarget:self];
        objc_setAssociatedObject(self, zhk_keyboardManager_UITextView, manager, OBJC_ASSOCIATION_RETAIN);
    }
    return manager;
}

@end
