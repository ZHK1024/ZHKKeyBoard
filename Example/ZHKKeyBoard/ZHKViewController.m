//
//  ZHKViewController.m
//  ZHKKeyBoard
//
//  Created by 389914070@qq.com on 07/30/2018.
//  Copyright (c) 2018 389914070@qq.com. All rights reserved.
//

#import "ZHKViewController.h"
#import "UITextField+ZHKKeyBoard.h"
#import "UITextView+ZHKKeyBoard.h"

@interface ZHKViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView  *textView;

@end

@implementation ZHKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.zhk_keyboardType = ZHKKeyboardTypePhonePad;
    _textField.zhk_keyboardType = ZHKKeyBoardTypeIDCard;
    
    _textField.delegate = self;
    _textView.delegate = self;
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"textField range = %@     %@", NSStringFromRange(range), string);
    
    if ([textField.text stringByReplacingCharactersInRange:range withString:string].length > 18) {
        return NO;
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    NSLog(@"textView range = %@     %@", NSStringFromRange(range), text);
    return YES;
}

@end
