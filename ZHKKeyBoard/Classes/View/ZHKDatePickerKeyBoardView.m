//
//  ZHKDatePickerKeyBoardView.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/3/24.
//

#import "ZHKDatePickerKeyBoardView.h"

@interface ZHKDatePickerKeyBoardView ()

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, assign, readonly) CGRect defaultFrame;

@end

@implementation ZHKDatePickerKeyBoardView

#pragma mark - Init

+ (instancetype)keyBoardWithDelegate:(id <ZHKKeyBoardDelegate>)delegate; {
    ZHKDatePickerKeyBoardView *keyBoard = [[ZHKDatePickerKeyBoardView alloc] init];
    return keyBoard;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI

- (void)setupUI {
    self.frame = self.defaultFrame;
    [self addSubview:self.datePicker];
}

- (void)setDate:(NSDate * _Nonnull)date {
    [_datePicker setDate:date];
}

#pragma mark - Getter

- (NSDate *)date {
    return _datePicker.date;
}

- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.defaultFrame), 250.0f)];
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _datePicker;
}

- (CGRect)defaultFrame {
    CGFloat width = CGRectGetWidth(UIScreen.mainScreen.bounds);
    if (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) == 20.0f) {
        return CGRectMake(0, 0, width, 250.0f);
    } else {
        return CGRectMake(0, 0, width, 250.0f + 21.0f);
    }
}

@end
