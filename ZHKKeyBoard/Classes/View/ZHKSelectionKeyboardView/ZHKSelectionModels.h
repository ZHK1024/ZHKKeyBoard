//
//  ZHKSelectionModel.h
//  Pods
//
//  Created by ZHK on 2020/4/21.
//
//

#import <Foundation/Foundation.h>

@protocol ZHKSelectionRow <NSObject>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray<id<ZHKSelectionRow>> *rows;

@end

@protocol ZHKSelectionInfo <NSObject>

@property (nonatomic, assign) NSUInteger component; // 列数
@property (nonatomic, copy) NSArray<id<ZHKSelectionRow>> *rows;

@end




