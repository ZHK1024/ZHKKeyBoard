//
//  ZHKKeyBoardManager.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2018/7/30.
//

#import "ZHKKeyBoardManager.h"
#import "ZHKIDCardKeyBoardView.h"
#import "ZHKIputTarget.h"
#import "ZHKKeyBoardDelegate.h"
#import "ZHKDatePickerKeyBoardView.h"

@interface ZHKKeyBoardManager () <ZHKKeyBoardDelegate>

@property (nonatomic, weak) id <UITextInput> target;

@end

@implementation ZHKKeyBoardManager

+ (instancetype)managerWithTarget:(id <UITextInput>)target {
    ZHKKeyBoardManager *manager = [[ZHKKeyBoardManager alloc] init];
    manager.target = target;
    return manager;
}

- (UIView *)keyboardWithType:(ZHKKeyBoardType)type {
    switch (type) {
        case ZHKKeyBoardTypeIDCard:
            return [ZHKIDCardKeyBoardView keyBoardWithDelegate:self];
        case ZHKKeyBoardTypeDate:
            return [ZHKDatePickerKeyBoardView keyBoardWithDelegate:self];
        default:
            _target.keyboardType = (UIKeyboardType)type;
            return nil;
    }
}

#pragma mark - ZHKKeyBoard delegate

- (void)keyboard:(id<ZHKKeyBoard>)keyBoard inputWord:(NSString *)word {
    if (([_target isKindOfClass:[UITextView class]] && [self textView:(UITextView *)_target inputWord:word]) ||
        ([_target isKindOfClass:[UITextField class]] && [self textField:(UITextField *)_target inputWord:word])) {
        [_target insertText:word];
    }
}

- (void)deleteBackward {
    if (([_target isKindOfClass:[UITextView class]] && [self textViewDeleteBackward:(UITextView *)_target]) ||
        ([_target isKindOfClass:[UITextField class]] && [self textFieldDeleteBackward:(UITextField *)_target])) {
        [_target deleteBackward];
    }
}

- (void)keyBoardHidded {
    [((UIView *)self.target) resignFirstResponder];
}

#pragma mark - InputWord

- (BOOL)textField:(UITextField *)textField inputWord:(NSString *)word {
    if ([textField.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [textField.delegate textField:(UITextField *)_target shouldChangeCharactersInRange:NSMakeRange(textField.text.length, 0) replacementString:word];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView inputWord:(NSString *)word {
    if ([textView.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [textView.delegate textView:(UITextView *)_target shouldChangeTextInRange:NSMakeRange(textView.text.length, 0) replacementText:word];
    }
    return YES;
}

#pragma mark - Delete

- (BOOL)textFieldDeleteBackward:(UITextField *)textField {
    if (textField.text.length == 0) {
        return NO;
    }
    if ([textField.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [textField.delegate textField:(UITextField *)_target shouldChangeCharactersInRange:[self deleteBackwardRange] replacementString:@""];
    }
    return YES;
}

- (BOOL)textViewDeleteBackward:(UITextView *)textView {
    if ([textView.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [textView.delegate textView:(UITextView *)_target shouldChangeTextInRange:[self deleteBackwardRange] replacementText:@""];
    }
    return YES;
}

- (NSRange)deleteBackwardRange {
    UITextPosition *pos = [_target positionFromPosition:_target.endOfDocument offset:-1];
    UITextRange *textRange = [_target textRangeFromPosition:pos toPosition:_target.endOfDocument];
    if (textRange.isEmpty) {
        return NSMakeRange(0, 0);
    }
    return NSMakeRange([_target offsetFromPosition:_target.beginningOfDocument toPosition:pos], 1);
}

@end
