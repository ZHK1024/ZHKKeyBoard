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

NSString *const zhk_keyboardTypeKey_UITextView = @"zhk_keyboardTypeKey_UITextView";
NSString *const zhk_keyboardManager_UITextView = @"zhk_keyboardManager_UITextView";
NSString *const zhk_date_UITextView            = @"zhk_date_UITextView";
NSString *const zhk_dateFormat_UITextView      = @"zhk_dateFormat_UITextView";
NSString *const zhk_BlockObject_UITextView     = @"zhk_BlockObject_UITextView";
//
static char *zhk_attribute_key_UITextView      = "4ebba881c3adebd02a0e0015a0447cc7";

@interface UITextView ()

@property (nonatomic, strong, readonly) NSMutableDictionary *zhk_attributes;
@property (nonatomic, strong, readonly) ZHKKeyBoardManager *zhk_keyboardManager;

@end

@implementation UITextView (ZHKKeyBoard)

#pragma mark - KeyboardType

- (ZHKKeyBoardType)zhk_keyboardType {
    NSNumber *type = self.zhk_attributes[zhk_keyboardTypeKey_UITextView];
    return type.integerValue;
}

- (void)setZhk_keyboardType:(ZHKKeyBoardType)zhk_keyboardType {
    self.zhk_attributes[zhk_keyboardTypeKey_UITextView] = @(zhk_keyboardType);
}

#pragma mark - Manager

- (ZHKKeyBoardManager *)zhk_keyboardManager {
    ZHKKeyBoardManager *manager = self.zhk_attributes[zhk_keyboardManager_UITextView];
    if (manager == nil) {
        manager = [ZHKKeyBoardManager managerWithTarget:self];
        self.zhk_attributes[zhk_keyboardManager_UITextView] = manager;
    }
    return manager;
}

#pragma mark - Block

- (ZHKBlockObject *)keyboardBlockObject {
    return self.zhk_attributes[zhk_BlockObject_UITextView];
}

- (void)setKeyboardBlock:(void (^)(id))block {
    self.zhk_attributes[zhk_BlockObject_UITextView] = [ZHKBlockObject object:block];
}

#pragma mark - Attributes

- (NSMutableDictionary *)zhk_attributes {
    NSMutableDictionary *attributes = objc_getAssociatedObject(self, zhk_attribute_key_UITextView);
    if (attributes == nil) {
        attributes = [NSMutableDictionary new];
        objc_setAssociatedObject(self, zhk_attribute_key_UITextView, attributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return attributes;
}

@end
