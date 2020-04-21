//
//  ZHKSelectionKeyboardView.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/21.
//

#import "ZHKSelectionKeyboardView.h"
#import "ZHKKeyBoardDelegate.h"

@interface ZHKSelectionKeyboardView () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIToolbar    *toolBar;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, assign, readonly) CGRect defaultFrame;
//
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) id <ZHKKeyBoardDelegate> delegate;
//
@property (nonatomic, strong) NSMutableArray<NSNumber *> *indexs;

@end

@implementation ZHKSelectionKeyboardView

#pragma mark - Init

+ (instancetype)keyBoardWithDelegate:(id <ZHKKeyBoardDelegate>)delegate; {
    ZHKSelectionKeyboardView *keyBoard = [[ZHKSelectionKeyboardView alloc] init];
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
    NSInteger count = _selectionInfo.component;
    if (count == 0) {
        [self cancelAction];
        return;
    }
    
    NSMutableString *text = [[NSMutableString alloc] init];
    NSMutableArray *objs = [NSMutableArray new];
    NSInteger index = _indexs.firstObject.integerValue;
    id <ZHKSelectionRow> rowModel = _selectionInfo.rows[index];
    [text appendString:rowModel.title];
    [objs addObject:rowModel];
    for (NSInteger component = 0; component < count; component++) {
        index = _indexs[component].integerValue;
        rowModel = rowModel.rows[index];
        if (rowModel) {
            [text appendString:rowModel.title];
            [objs addObject:rowModel];
        }
    }
    
    [_delegate keyboard:self inputWord:text replace:YES];
    
    if ([_delegate respondsToSelector:@selector(keyboard:inputObject:)]) {
        [_delegate keyboard:self inputObject:objs];
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
    return _selectionInfo.component;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger index = _indexs.firstObject.integerValue;
    if (component == 0) {
        return _selectionInfo.rows.count;
    }
    id <ZHKSelectionRow> row = _selectionInfo.rows[index];
    for (NSInteger i = 0; i < component - 1; i++) {
        index = _indexs[i].integerValue;
        row = row.rows[MIN(index, row.rows.count - 1)];
    }
    return row.rows.count;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return _selectionInfo.rows[row].title;
    }
    NSInteger index = _indexs.firstObject.integerValue;
    id <ZHKSelectionRow> rowModel = _selectionInfo.rows[index];
    for (NSInteger i = 0; i < component - 1; i++) {
        index = _indexs[i].integerValue;
        rowModel = rowModel.rows[index];
        NSLog(@"%s", __func__);
    }
    return rowModel.rows[row].title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _indexs[component] = @(row);
    [pickerView reloadAllComponents];
}

#pragma mark - Setter

- (void)setSelectionInfo:(id<ZHKSelectionInfo>)selectionInfo {
    if (_selectionInfo != selectionInfo) {
        _selectionInfo = selectionInfo;
        [self.indexs removeAllObjects];
        for (NSInteger i = 0; i < _selectionInfo.component; i++) {
            [self.indexs addObject:@0];
        }
        [_pickerView reloadAllComponents];
    }
}

#pragma mark - Getter

- (NSMutableArray *)indexs {
    if (_indexs == nil) {
        self.indexs = [NSMutableArray new];
    }
    return _indexs;
}

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
