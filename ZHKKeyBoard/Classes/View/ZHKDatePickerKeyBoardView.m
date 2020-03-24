//
//  ZHKDatePickerKeyBoardView.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/3/24.
//

#import "ZHKDatePickerKeyBoardView.h"
#import "ZHKKeyBoardDelegate.h"

@interface ZHKDatePickerKeyBoardView ()

@property (nonatomic, strong) UIToolbar    *toolBar;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, assign, readonly) CGRect defaultFrame;
//
@property (nonatomic, weak) id <ZHKKeyBoardDelegate> delegate;

@end

@implementation ZHKDatePickerKeyBoardView

#pragma mark - Init

+ (instancetype)keyBoardWithDelegate:(id <ZHKKeyBoardDelegate>)delegate; {
    ZHKDatePickerKeyBoardView *keyBoard = [[ZHKDatePickerKeyBoardView alloc] init];
    keyBoard.delegate = delegate;
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
    [self addSubview:self.toolBar];
    [self addSubview:self.datePicker];
}


#pragma mark - Action

- (void)selectAction {
    if ([_delegate respondsToSelector:@selector(keyboard:inputWord:)]) {
        [_delegate keyboard:self inputWord:[self.formatter stringFromDate:self.datePicker.date] ?: @""];
    }
    [self cancelAction];
}

- (void)cancelAction {
    if ([_delegate respondsToSelector:@selector(keyBoardHidded)]) {
        [_delegate keyBoardHidded];
    }
}

#pragma mark - Setter

- (void)setDate:(NSDate * _Nonnull)date {
    [_datePicker setDate:date];
}

#pragma mark - Getter

- (NSDateFormatter *)formatter {
    if (_formatter == nil) {
        self.formatter = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = @"yyyy-MM-dd";
    }
    return _formatter;
}

- (NSDate *)date {
    return _datePicker.date;
}

- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44.0f, CGRectGetWidth(self.defaultFrame), 240.0f)];
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _datePicker;
}

- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.defaultFrame), 44.0f)];
        _toolBar.items = @[
            [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAction)],
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
            [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(selectAction)],
        ];
    }
    return _toolBar;
}

- (CGRect)defaultFrame {
    CGFloat width = CGRectGetWidth(UIScreen.mainScreen.bounds);
    if (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) == 20.0f) {
        return CGRectMake(0, 0, width, 280.0f);
    } else {
        return CGRectMake(0, 0, width, 280.0f + 21.0f);
    }
}

@end
