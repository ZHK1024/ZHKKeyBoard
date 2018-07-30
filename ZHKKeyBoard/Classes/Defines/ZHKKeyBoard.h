//
//  ZHKKeyBoard.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//
//

#import "ZHKKeyBoardDefine.h"

@protocol ZHKKeyBoardDelegate;
@protocol ZHKKeyBoard <NSObject>

+ (instancetype)keyBoardWithDelegate:(id <ZHKKeyBoardDelegate>)delegate;

@end
