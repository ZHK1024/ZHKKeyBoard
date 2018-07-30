//
//  UITextField+ZHKKeyBoard.m
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import "UITextField+ZHKKeyBoard.h"
#import <objc/runtime.h>
#import "ZHKKeyBoardManager.h"

static char *zhk_keyboardTypeKey_UITextField = "zhk_keyboardTypeKey_UITextField";
static char *zhk_keyboardManager_UITextField = "zhk_keyboardManager_UITextField";

@interface UITextField ()

@property (nonatomic, strong, readonly) ZHKKeyBoardManager *zhk_keyboardManager;

@end

@implementation UITextField (ZHKKeyBoard)

- (void)setZhk_keyboardType:(ZHKKeyBoardType)zhk_keyboardType {
    objc_setAssociatedObject(self, zhk_keyboardTypeKey_UITextField, @(zhk_keyboardType), OBJC_ASSOCIATION_RETAIN);
    self.inputView = [self.zhk_keyboardManager keyboardWithType:zhk_keyboardType];
}

- (ZHKKeyBoardType)zhk_keyboardType {
    NSNumber *type = objc_getAssociatedObject(self, zhk_keyboardTypeKey_UITextField);
    return type.integerValue;
}

- (ZHKKeyBoardManager *)zhk_keyboardManager {
    ZHKKeyBoardManager *manager = objc_getAssociatedObject(self, zhk_keyboardManager_UITextField);
    if (manager == nil) {
        manager = [ZHKKeyBoardManager managerWithTarget:self];
        objc_setAssociatedObject(self, zhk_keyboardManager_UITextField, manager, OBJC_ASSOCIATION_RETAIN);
    }
    return manager;
}

@end
