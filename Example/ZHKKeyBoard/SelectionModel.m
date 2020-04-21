//
//  SelectionModel.m
//  ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/21.
//  Copyright © 2020 389914070@qq.com. All rights reserved.
//

#import "SelectionModel.h"




@implementation SelectionModel

- (instancetype)initWithSource:(NSArray *)sources component:(NSInteger *)component {
    if (![sources isKindOfClass:[NSArray class]]) {
        return nil;
    }
    if (self = [super init]) {
        NSMutableArray *temp = [NSMutableArray new];
        for (NSArray *source in sources) {
            if (![source isKindOfClass:[NSArray class]]) {
                continue;
            }
            SelectionModel *row = [[SelectionModel alloc] initWithSource:source component:component];
            
            if (row) {
                [temp addObject:row];
            }
        }
        *component += 1;
        self.rows = temp;
    }
    return self;
}

- (NSString *)description {
    return _title;
}

@end


@implementation SelectionInfoModel

+ (SelectionInfoModel *)infoWithSource:(NSArray *)sources {
    if (![sources isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSInteger component = 0;
    SelectionInfoModel *model = [[SelectionInfoModel alloc] init];
    NSMutableArray *temp = [NSMutableArray new];
    for (NSArray *source in sources) {
        SelectionModel *row = [[SelectionModel alloc] initWithSource:source component:&component];
        if (row) {
            [temp addObject:row];
        }
    }
    return model;
}

- (NSString *)description {
    return _rows.description;
}

@end
