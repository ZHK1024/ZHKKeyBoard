#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UITextField+ZHKKeyBoard.h"
#import "UITextView+ZHKKeyBoard.h"
#import "ZHKIputTarget.h"
#import "ZHKKeyBoard.h"
#import "ZHKKeyBoardDefine.h"
#import "ZHKKeyBoardDelegate.h"
#import "ZHKKeyBoardManager.h"
#import "ZHKIDCardKeyBoardView.h"
#import "ZHKKIDCardKeyBoardItem.h"

FOUNDATION_EXPORT double ZHKKeyBoardVersionNumber;
FOUNDATION_EXPORT const unsigned char ZHKKeyBoardVersionString[];

