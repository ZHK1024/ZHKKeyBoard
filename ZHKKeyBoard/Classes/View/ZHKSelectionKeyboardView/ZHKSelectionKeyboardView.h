//
//  ZHKSelectionKeyboardView.h
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/21.
//

#import <UIKit/UIKit.h>
#import "ZHKKeyBoardView.h"
#import "ZHKSelectionModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHKSelectionKeyboardView : UIView <ZHKKeyBoardView>

@property (nonatomic, strong) id<ZHKSelectionInfo> selectionInfo;

@end

NS_ASSUME_NONNULL_END
