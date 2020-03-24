//
//  ZHKDatePickerKeyBoardView.h
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/3/24.
//

#import <UIKit/UIKit.h>
#import "ZHKKeyBoard.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHKDatePickerKeyBoardView : UIView <ZHKKeyBoard>

@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSDate *date;

@end

NS_ASSUME_NONNULL_END
