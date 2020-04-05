//
//  ZHKKIDCardKeyBoardItem.m
//  ZHKKeyBoard
//
//  Created by ZHK on 2018/7/30.
//

#import "ZHKKIDCardKeyBoardItem.h"

@interface ZHKKIDCardKeyBoardItem ()

@property (nonatomic, strong) CAShapeLayer *highlightLayer;

@end

@implementation ZHKKIDCardKeyBoardItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI

- (void)setupUI {
    [self.contentView.layer addSublayer:self.highlightLayer];
    [self.contentView addSubview:self.titleLabel];
    
    _titleLabel.frame = self.contentView.bounds;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.cornerRadius = 4.0f;
    
    self.clipsToBounds = YES;
    _highlightLayer.hidden = YES;
}

- (void)setHighlight:(BOOL)highlight {
    if (_highlight != highlight) {
        _highlight = highlight;
        _highlightLayer.hidden = !_highlight;
    }
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:25.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (CAShapeLayer *)highlightLayer {
    if (_highlightLayer == nil) {
        self.highlightLayer = [CAShapeLayer new];
        _highlightLayer.frame = self.bounds;
        _highlightLayer.backgroundColor = [UIColor colorWithRed:0.70 green:0.71 blue:0.75 alpha:1].CGColor;
    }
    return _highlightLayer;
}

@end
