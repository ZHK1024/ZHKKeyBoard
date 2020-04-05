//
//  ZHKKeyBoardDefine.h
//  Pods
//
//  Created by ZHK on 2018/7/30.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZHKKeyBoardType) {
    
    // System
    ZHKKeyboardTypeDefault,                // Default type for the current input method.
    ZHKKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters
    ZHKKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
    ZHKKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
    ZHKKeyboardTypeNumberPad,              // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
    ZHKKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
    ZHKKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
    ZHKKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
    ZHKKeyboardTypeDecimalPad NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
    ZHKKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
    ZHKKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
    ZHKKeyboardTypeASCIICapableNumberPad NS_ENUM_AVAILABLE_IOS(10_0), // A number pad (0-9) that will always be ASCII digits.
    
    ZHKKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated
    
    // Custom
    ZHKKeyBoardTypeIDCard,      // ID Card
    ZHKKeyBoardTypeDate,        // Date
};

