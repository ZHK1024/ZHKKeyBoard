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
#import "ZHKDatePickerKeyBoardView.h"

const NSString *zhk_keyboardTypeKey_UITextField = @"zhk_keyboardTypeKey_UITextField";
const NSString *zhk_keyboardManager_UITextField = @"zhk_keyboardManager_UITextField";
const NSString *zhk_date_UITextField            = @"zhk_date_UITextField";
const NSString *zhk_dateFormat_UITextField      = @"zhk_dateFormat_UITextField";
//
static char *zhk_attribute_key                  = "4ebba881c3adebd02a0e0015a0447cc7";

@interface UITextField ()

@property (nonatomic, strong, readonly) NSMutableDictionary *zhk_attributes;
@property (nonatomic, strong, readonly) ZHKKeyBoardManager *zhk_keyboardManager;

@end

@implementation UITextField (ZHKKeyBoard)

#pragma mark - KeyBoard Type

- (void)setZhk_keyboardType:(ZHKKeyBoardType)zhk_keyboardType {
    self.zhk_attributes[zhk_keyboardTypeKey_UITextField] = @(zhk_keyboardType);
    self.inputView = [self.zhk_keyboardManager keyboardWithType:zhk_keyboardType];
}

- (ZHKKeyBoardType)zhk_keyboardType {
    NSNumber *type = self.zhk_attributes[zhk_keyboardTypeKey_UITextField];
    return type.integerValue;
}

#pragma mark - KeyBoard Manager

- (ZHKKeyBoardManager *)zhk_keyboardManager {
    ZHKKeyBoardManager *manager = self.zhk_attributes[zhk_keyboardManager_UITextField];
    if (manager == nil) {
        manager = [ZHKKeyBoardManager managerWithTarget:self];
        self.zhk_attributes[zhk_keyboardManager_UITextField] = manager;
    }
    return manager;
}

#pragma mark - Date

- (NSDate *)zhk_date {
    ZHKDatePickerKeyBoardView *keyboard = (ZHKDatePickerKeyBoardView *)self.inputView;
    if (keyboard == nil || ![keyboard isKindOfClass:[ZHKDatePickerKeyBoardView class]]) {
        return self.zhk_attributes[zhk_date_UITextField];
    }
    return keyboard.date;
}

- (void)setZhk_date:(NSDate *)zhk_date {
    self.zhk_attributes[zhk_date_UITextField] = zhk_date;
    ZHKDatePickerKeyBoardView *keyboard = (ZHKDatePickerKeyBoardView *)self.inputView;
    if (keyboard == nil || ![keyboard isKindOfClass:[ZHKDatePickerKeyBoardView class]]) {
        return;
    }
    keyboard.date = zhk_date;
}

- (NSString *)zhk_dateFormat {
    return self.zhk_attributes[zhk_dateFormat_UITextField];
}

- (void)setZhk_dateFormat:(NSString *)zhk_dateFormat {
    self.zhk_attributes[zhk_dateFormat_UITextField] = zhk_dateFormat;
    ZHKDatePickerKeyBoardView *keyboard = (ZHKDatePickerKeyBoardView *)self.inputView;
    if (keyboard == nil || ![keyboard isKindOfClass:[ZHKDatePickerKeyBoardView class]]) {
        return;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = zhk_dateFormat;
    keyboard.formatter = formatter;
}

#pragma mark - Attributes

- (NSMutableDictionary *)zhk_attributes {
    NSMutableDictionary *obj = objc_getAssociatedObject(self, zhk_attribute_key);
    if (obj == nil) {
        obj = [NSMutableDictionary new];
        objc_setAssociatedObject(self, zhk_attribute_key, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}


@end
