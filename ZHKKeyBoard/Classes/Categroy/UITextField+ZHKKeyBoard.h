//
//  UITextField+ZHKKeyBoard.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import "ZHKKeyBoardDefine.h"

@interface UITextField (ZHKKeyBoard)

@property (nonatomic, assign) ZHKKeyBoardType zhk_keyboardType;
@property (nonatomic, strong) NSDate *zhk_date;     // 日期对象
@property (nonatomic, strong) NSString *zhk_dateFormat; // 日期格式化

@end
