//
//  ZHKIDCardKeyBoardView.h
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2018/7/30.
//

#import <UIKit/UIKit.h>
#import "ZHKKeyBoard.h"

@interface ZHKIDCardKeyBoardView : UIView <ZHKKeyBoard>

@property (nonatomic, weak) id <ZHKKeyBoardDelegate> delegate;

@end
