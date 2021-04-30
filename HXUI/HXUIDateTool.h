//
//  NSDate+HXUIDateTool.h
//  TestDemo
//
//  Created by SS001 on 2021/4/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXUIDateTool : NSObject

+ (instancetype)shareInstance;

/**
 根据传入的时间，计算明天的时间

 @param nowdate   传入的时间
 @param formatter 格式：2019-06-10
 @return 返回时间   格式：2019-06-10
 */
- (NSString *__nonnull)getTomorrow:(NSString *__nonnull)nowdate formatter:(NSString *__nullable)formatter;

@end

NS_ASSUME_NONNULL_END
