# ZHKKeyBoard

[![Build Status](https://travis-ci.org/ZHK1024/ZHKKeyBoard.svg?branch=master)](https://travis-ci.org/ZHK1024/ZHKKeyBoard)
[![Version](https://img.shields.io/cocoapods/v/ZHKKeyBoard.svg?style=flat)](https://cocoapods.org/pods/ZHKKeyBoard)
[![License](https://img.shields.io/cocoapods/l/ZHKKeyBoard.svg?style=flat)](https://cocoapods.org/pods/ZHKKeyBoard)
[![Platform](https://img.shields.io/cocoapods/p/ZHKKeyBoard.svg?style=flat)](https://cocoapods.org/pods/ZHKKeyBoard)


## Installation

ZHKKeyBoard is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZHKKeyBoard'
```
or
```ruby
pod 'ZHKKeyBoard', :git => 'https://github.com/ZHK1024/ZHKKeyBoard.git'
```

## Usage

```objc
// UITextField
UITextField *textFile = [[UITextField alloc] init];
textFile.zhk_keyboardType = ZHKKeyBoardTypeIDCard;

// UITextView
UITextView *textView = [[UITextView alloc] init];
textFile.zhk_keyboardType = ZHKKeyBoardTypeIDCard;
```
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

`ZHKKeyBoardTypeIDCard`
![ZHKKeyBoardTypeIDCard](https://github.com/ZHK1024/ZHKKeyBoard/blob/master/Images/IMG_0092.PNG?raw=true)
<img src="https://github.com/ZHK1024/ZHKKeyBoard/blob/master/Images/IMG_0092.PNG?raw=true" width=256 />


## Author

ZHK1024

## License

ZHKKeyBoard is available under the MIT license. See the LICENSE file for more info.
