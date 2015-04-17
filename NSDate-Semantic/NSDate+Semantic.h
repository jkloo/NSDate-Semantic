//
//  NSDate+Semantic.h
//  NSDate-Semantic
//
//  Created by Jeff Kloosterman on 4/16/15.
//  Copyright (c) 2015 Jeff Kloosterman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSDate (Semantic)

+ (NSDate *)dateWhichIsNext:(NSString *)dayName;

+ (NSDate *)dateWhichIsNext:(NSString *)dayName At:(NSString *)timeString;

+ (NSDate *)dateWhichIs:(NSInteger)weeks WeeksFromNext:(NSString *)dayName;

+ (NSDate *)dateWhichIs:(NSInteger)weeks WeeksFromNext:(NSString *)dayName At:(NSString *)timeString;

@end
