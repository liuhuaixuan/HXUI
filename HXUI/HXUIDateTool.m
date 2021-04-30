//
//  NSDate+HXUIDateTool.m
//  TestDemo
//
//  Created by SS001 on 2021/4/30.
//

#import "HXUIDateTool.h"

@implementation HXUIDateTool

static HXUIDateTool *tool = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool == nil) {
            tool = [[HXUIDateTool alloc] init];
        }
    });
    return tool;
}

- (NSString *)getTomorrow:(NSString *)nowdate formatter:(NSString *)formatter
{
    if (!formatter) {
        formatter = @"yyyy-MM-dd";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSDate *aDate = [dateFormatter dateFromString:nowdate];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:formatter];
    return [dateday stringFromDate:beginningOfWeek];
}

@end
