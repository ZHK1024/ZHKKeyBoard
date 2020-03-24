//
//  ZHKIDCardKeyBoardView.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2018/7/30.
//

#import "ZHKIDCardKeyBoardView.h"
#import "ZHKKIDCardKeyBoardItem.h"
#import "ZHKKeyBoardDelegate.h"

@interface ZHKIDCardKeyBoardView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) CGRect   defaultFrame;    // 默认 frame

@end

@implementation ZHKIDCardKeyBoardView

- (instancetype)init {
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

+ (instancetype)keyBoardWithDelegate:(id <ZHKKeyBoardDelegate>)delegate {
    ZHKIDCardKeyBoardView *keyBoard = [[ZHKIDCardKeyBoardView alloc] init];
    keyBoard.delegate = delegate;
    return keyBoard;
}

#pragma mark - UI

- (void)setupUI {
    self.frame = self.defaultFrame;
    [self addSubview:self.collectionView];
//    if (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) == 20.0f) {
//        self.frame = self.defaultFrame;
//    } else {
//        CGRect frame = self.defaultFrame;
//        frame.size.height += 21.0f;
//        self.frame = frame;
//    }
    self.frame = self.defaultFrame;
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZHKKIDCardKeyBoardItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = _titles[indexPath.row];
    return cell;
}

#pragma mark -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 11) {
        if ([_delegate respondsToSelector:@selector(keyboard:inputWord:)]) {
            [_delegate keyboard:self inputWord:_titles[indexPath.row]];
        }
    } else {
        if ([_delegate respondsToSelector:@selector(deleteBackward)]) {
            [_delegate deleteBackward];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    ZHKKIDCardKeyBoardItem *cell = (ZHKKIDCardKeyBoardItem *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.highlight = YES;
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ZHKKIDCardKeyBoardItem *cell = (ZHKKIDCardKeyBoardItem *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.highlight = NO;
    });
}

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat width = CGRectGetWidth(UIScreen.mainScreen.bounds);
        CGFloat scaleX = width / 414.0f;
        CGFloat gap = 8.0f;
        CGRect frame = CGRectMake(0, 0, width, 255.0f * scaleX);
        layout.itemSize = CGSizeMake(ceil((width - 4 * gap) / 3.0f), 48.0f * scaleX);
        layout.sectionInset = UIEdgeInsetsMake(gap, gap, gap, gap);
        layout.minimumLineSpacing = gap;
        layout.minimumInteritemSpacing = 0.0f;
        self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.allowsSelection = YES;
        [_collectionView registerClass:[ZHKKIDCardKeyBoardItem class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = [UIColor colorWithRed:209 / 255.0 green:212 / 255.0 blue:219 / 255.0 alpha:1];
        _collectionView.delaysContentTouches = NO;
    }
    return _collectionView;
}

- (NSArray *)titles {
    if (_titles == nil) {
        self.titles = @[@"7",
                        @"8",
                        @"9",
                        @"4",
                        @"5",
                        @"6",
                        @"1",
                        @"2",
                        @"3",
                        @"X",
                        @"0",
                        @"←"
                        ];
    }
    return _titles;
}

- (CGRect)defaultFrame {
    CGFloat scaleX = CGRectGetWidth(UIScreen.mainScreen.bounds) / 414.0f;
    if (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) == 20.0f) {
        return CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds), 235.0f * scaleX);
    } else {
        return CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds), 280.0f * scaleX + 21.0f);
    }
}

@end
