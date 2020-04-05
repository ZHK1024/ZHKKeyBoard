//
//  ZHKBlockObject.m
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/5.
//

#import "ZHKBlockObject.h"

@interface ZHKBlockObject ()

@property (nonatomic, copy) ZHKPropertyBlock ablock;

@end

@implementation ZHKBlockObject

+ (instancetype)object:(ZHKPropertyBlock)block {
    ZHKBlockObject *obj = nil;
    if (block) {
        obj = [ZHKBlockObject new];
        obj.ablock = block;
    }
    return obj;
}

- (ZHKPropertyBlock)block {
    return _ablock;
}

@end
