//
//  ZHKViewController.m
//  ZHKKeyBoard
//
//  Created by 389914070@qq.com on 07/30/2018.
//  Copyright (c) 2018 389914070@qq.com. All rights reserved.
//

#import "ZHKViewController.h"
#import <ZHKKeyBoard.h>
#import "SelectionModel.h"

@interface ZHKViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView  *textView;

@end

@implementation ZHKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.zhk_keyboardType = ZHKKeyboardTypePhonePad;
    
//    _textField.zhk_dateFormat = @"yyyy-MM-dd";
    _textField.delegate = self;
    _textView.delegate = self;
    
    _textField.selectionInfo = ({
        SelectionInfoModel *info = [[SelectionInfoModel alloc] init];
        info.component = 1;
        
            info.rows = @[
                ({
                    SelectionModel *row = [[SelectionModel alloc] init];
                    row.title = @"河南省";
                    row;
                }),
                ({
                    SelectionModel *row = [[SelectionModel alloc] init];
                    row.title = @"浙江省";
                    row;
                }),
                ({
                    SelectionModel *row = [[SelectionModel alloc] init];
                    row.title = @"北京市";
                    row;
                }),
            ];
            info;
        });
//        info.rows = @[
//            ({
//                SelectionModel *row = [[SelectionModel alloc] init];
//                row.title = @"河南省";
//                row.rows = @[
//                    ({
//                        SelectionModel *row = [[SelectionModel alloc] init];
//                        row.title = @"郑州市";
//                        row.rows = @[
//                            ({
//                                SelectionModel *row = [[SelectionModel alloc] init];
//                                row.title = @"中原区";
//                                row;
//                            }),
//                        ];
//                        row;
//                    }),
//                    ({
//                        SelectionModel *row = [[SelectionModel alloc] init];
//                        row.title = @"洛阳市";
//                        row.rows = @[
//                            ({
//                                SelectionModel *row = [[SelectionModel alloc] init];
//                                row.title = @"涧西区";
//                                row;
//                            }),
//                            ({
//                                SelectionModel *row = [[SelectionModel alloc] init];
//                                row.title = @"西工区";
//                                row;
//                            }),
//                        ];
//                        row;
//                    }),
//                ];
//                row;
//            }),
//            ({
//                SelectionModel *row = [[SelectionModel alloc] init];
//                row.title = @"浙江省";
//                row.rows = @[
//                    ({
//                        SelectionModel *row = [[SelectionModel alloc] init];
//                        row.title = @"绍兴市";
//                        row.rows = @[
//                            ({
//                                SelectionModel *row = [[SelectionModel alloc] init];
//                                row.title = @"某某区";
//                                row;
//                            }),
//                        ];
//                        row;
//                    }),
//                    ({
//                        SelectionModel *row = [[SelectionModel alloc] init];
//                        row.title = @"杭州市";
//                        row.rows = @[
//                            ({
//                                SelectionModel *row = [[SelectionModel alloc] init];
//                                row.title = @"江干区";
//                                row;
//                            }),
//                            ({
//                                SelectionModel *row = [[SelectionModel alloc] init];
//                                row.title = @"西湖区";
//                                row;
//                            }),
//                        ];
//                        row;
//                    }),
//                ];
//                row;
//            }),
//        ];
//        info;
//    });
    
    
    
    
    _textField.zhk_keyboardType = ZHKKeyBoardTypeSelection;
    [_textField setKeyboardBlock:^(id object) {
        NSLog(@"obj: %@", object);
    }];
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
