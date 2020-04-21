//
//  SelectionModel.h
//  ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/21.
//  Copyright © 2020 389914070@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZHKSelectionModels.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectionModel : NSObject <ZHKSelectionRow>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray<id<ZHKSelectionRow>> *rows;

@end


@interface SelectionInfoModel : NSObject <ZHKSelectionInfo>

@property (nonatomic, assign) NSUInteger component; // 列数
@property (nonatomic, copy) NSArray<id<ZHKSelectionRow>> *rows;

+ (SelectionInfoModel *)infoWithSource:(NSArray *)source;

@end

NS_ASSUME_NONNULL_END
