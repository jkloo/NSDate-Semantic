//
//  NSDate+Semantic.m
//  NSDate-Semantic
//
//  Created by Jeff Kloosterman on 4/16/15.
//  Copyright (c) 2015 Jeff Kloosterman. All rights reserved.
//

#import "NSDate+Semantic.h"

@implementation NSDate (Semantic)

static NSCalendar *sharedCalendar = nil;
static NSDateFormatter *sharedTimeFormater = nil;
static const unsigned timeComponents = NSCalendarUnitHour | NSCalendarUnitMinute;
static const unsigned dateComponents =
    (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitHour |
     NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekday);

+ (NSInteger)dayNumberForDay:(NSString *)dayName
{
    NSDictionary *dayMap = @{
        @"sunday" : @1,
        @"monday" : @2,
        @"tuesday" : @3,
        @"wednesday" : @4,
        @"thursday" : @5,
        @"friday" : @6,
        @"saturday" : @7,
    };

    return [[dayMap valueForKey:[dayName lowercaseString]] integerValue];
}

+ (NSString *)dayStringForDay:(NSInteger)dayNumber
{
    NSArray *dayMap = @[
        @"sunday",
        @"monday",
        @"tuesday",
        @"wednesday",
        @"thursday",
        @"friday",
        @"saturday",
    ];

    return (NSString *)[dayMap objectAtIndex:dayNumber - 1];
}

+ (NSCalendar *)currentCalendar
{
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        [sharedCalendar setLocale:[NSLocale currentLocale]];
    }
    return sharedCalendar;
}

+ (NSDateFormatter *)timeFormatter
{
    if (!sharedTimeFormater) {
        sharedTimeFormater = [NSDateFormatter new];
        [sharedTimeFormater setDateFormat:@"HH:mm"];
    }
    return sharedTimeFormater;
}

+ (NSDateComponents *)todayComponents
{
    NSDateComponents *todayComponents = [[NSDate currentCalendar] components:dateComponents fromDate:[NSDate date]];
    return todayComponents;
}

+ (NSInteger)deltaDaysFor:(NSString *)dayName Weeks:(NSInteger)weeks
{
    NSDateComponents *tc = [NSDate todayComponents];
    NSInteger todayNumber = [tc weekday];
    NSInteger targetNumber = [NSDate dayNumberForDay:dayName];
    NSInteger addDays = 0;
    if (targetNumber > todayNumber) {
        addDays = targetNumber - todayNumber;
    } else {
        addDays = 7 - todayNumber + targetNumber;
    }
    addDays += 7 * weeks;

    return addDays;
}

+ (NSDate *)dateForDate:(NSDate *)date AtTime:(NSString *)timeString
{
    NSDateComponents *tc = [[NSDate currentCalendar] components:dateComponents fromDate:date];
    NSDate *time = [[NSDate timeFormatter] dateFromString:timeString];
    NSDateComponents *comp = [[NSDate currentCalendar] components:timeComponents fromDate:time];

    tc.hour = comp.hour;
    tc.minute = comp.minute;
    tc.second = 0;
    return [[NSDate currentCalendar] dateFromComponents:tc];
}

+ (NSDate *)dateWhichIsNext:(NSString *)dayName
{
    return [NSDate dateWhichIs:0 WeeksFromNext:dayName];
}

+ (NSDate *)dateWhichIsNext:(NSString *)dayName At:(NSString *)timeString
{

    return [NSDate dateWhichIs:0 WeeksFromNext:dayName At:timeString];
}

+ (NSDate *)dateWhichIs:(NSInteger)weeks WeeksFromNext:(NSString *)dayName
{
    return [[NSDate currentCalendar] dateByAddingUnit:NSCalendarUnitDay
                                                value:[NSDate deltaDaysFor:dayName Weeks:weeks]
                                               toDate:[NSDate date]
                                              options:NSCalendarMatchStrictly];
}

+ (NSDate *)dateWhichIs:(NSInteger)weeks WeeksFromNext:(NSString *)dayName At:(NSString *)timeString
{
    return [NSDate dateForDate:[NSDate dateWhichIs:weeks WeeksFromNext:dayName] AtTime:timeString];
}

@end
