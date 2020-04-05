//
//  ZHKLocationKeyBoardView.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/5.
//

#import "ZHKLocationKeyBoardView.h"
#import "ZHKKeyBoardDelegate.h"

@interface ZHKLocationKeyBoardView () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIToolbar    *toolBar;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, assign, readonly) CGRect defaultFrame;
//
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) id <ZHKKeyBoardDelegate> delegate;
//
@property (nonatomic, assign) NSInteger provinceIdx;    // 省份索引
@property (nonatomic, assign) NSInteger cityIdx;        // 城市索引
@property (nonatomic, assign) NSInteger areaIdx;        // 区域索引

@end

@implementation ZHKLocationKeyBoardView

#pragma mark - Init

+ (instancetype)keyBoardWithDelegate:(id <ZHKKeyBoardDelegate>)delegate; {
    ZHKLocationKeyBoardView *keyBoard = [[ZHKLocationKeyBoardView alloc] init];
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
    [self addSubview:self.pickerView];
}


#pragma mark - Action

- (void)selectAction {
    NSString *province = _dataSource[_provinceIdx][@"name"];
    NSString *city = _dataSource[_provinceIdx][@"city"][_cityIdx][@"name"];
    NSString *area = _dataSource[_provinceIdx][@"city"][_cityIdx][@"area"][_areaIdx];
    if ([_delegate respondsToSelector:@selector(keyboard:inputWord:replace:)]) {
        NSMutableString *text = [NSMutableString stringWithString:province];
        if (![city isEqualToString:province]) {
            [text appendString:city];
        }
        if (![city isEqualToString:area]) {
            [text appendString:area];
        }
        [_delegate keyboard:self inputWord:text replace:YES];
    }
    if ([_delegate respondsToSelector:@selector(keyboard:inputObject:)]) {
        [_delegate keyboard:self inputObject:@[
            province ?: @"",
            city ?: @"",
            area ?: @""
        ]];
    }
    [self cancelAction];
}

- (void)cancelAction {
    if ([_delegate respondsToSelector:@selector(keyBoardHidded)]) {
        [_delegate keyBoardHidded];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [self.dataSource count];
        case 1:
            return [_dataSource[_provinceIdx][@"city"] count];
        case 2: {
            NSArray *cityInfo = _dataSource[_provinceIdx][@"city"];
            _cityIdx = MIN(_cityIdx, cityInfo.count - 1);
            return [cityInfo [_cityIdx][@"area"] count];
        }
    }
    return 0;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return _dataSource[row][@"name"];
        case 1:
            return _dataSource[_provinceIdx][@"city"][row][@"name"];
        case 2: {
            NSArray *cityInfo = _dataSource[_provinceIdx][@"city"];
            _cityIdx = MIN(_cityIdx, cityInfo.count - 1);
            return cityInfo[_cityIdx][@"area"][row];
        }
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            _provinceIdx = row;
            [pickerView reloadComponent: 1];
            [pickerView reloadComponent:2];
            break;
        case 1:
            _cityIdx = row;
            [pickerView reloadComponent: 2];
            break;
        case 2:
            _areaIdx = row;
            break;
    }
}

#pragma mark - Setter


#pragma mark - Getter

- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44.0f, CGRectGetWidth(self.defaultFrame), 240.0f)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.defaultFrame), 44.0f)];
        _toolBar.items = @[
            ({
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAction)];
                item.tintColor = [UIColor grayColor];
                item;
            }),
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

- (NSArray *)dataSource {
    if (_dataSource == nil) {
        @try {
            NSData *data = [NSData dataWithContentsOfFile:({
                NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"ZHKKeyBoard" ofType:@"bundle"];
                [[NSBundle bundleWithPath:bundlePath] pathForResource:@"province" ofType:@"json"];
            })];
            self.dataSource = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        } @catch (NSException *exception) {
#if DEBUG
            NSLog(@"exception: %@", exception);
#endif
            self.dataSource = @[];
        }
    }
    return _dataSource;
}

@end
