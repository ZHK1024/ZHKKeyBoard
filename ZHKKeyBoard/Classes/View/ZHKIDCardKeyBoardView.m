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
//@property (nonatomic, weak) id <UITextInput> target;

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
    if (CGRectEqualToRect([UIScreen mainScreen].bounds, CGRectMake(0, 0, 375.0, 812.0)) ) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 280);
    } else {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250);
    }
    [self addSubview:self.collectionView];
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
        layout.itemSize = CGSizeMake(110, 45);
        layout.sectionInset = UIEdgeInsetsMake(20, 10, 20, 10);
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.allowsSelection = YES;
        [_collectionView registerClass:[ZHKKIDCardKeyBoardItem class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = [UIColor colorWithRed:209 / 255.0 green:212 / 255.0 blue:219 / 255.0 alpha:1];
    }
    return _collectionView;
}

- (NSArray *)titles {
    if (_titles == nil) {
        self.titles = @[@"1",
                        @"2",
                        @"3",
                        @"4",
                        @"5",
                        @"6",
                        @"7",
                        @"8",
                        @"9",
                        @"X",
                        @"0",
                        @"←"
                        ];
    }
    return _titles;
}

@end
