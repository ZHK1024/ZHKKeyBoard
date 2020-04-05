//
//  ZHKBlockObject.h
//  Pods-ZHKKeyBoard_Example
//
//  Created by ZHK on 2020/4/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZHKPropertyBlock)(id object);

@interface ZHKBlockObject : NSObject

@property (nonatomic, copy, readonly) ZHKPropertyBlock block;

+ (instancetype)object:(ZHKPropertyBlock)block;

@end

NS_ASSUME_NONNULL_END
