//
//  NSDate+JKLRelativeTime.m
//
//  Copyright (c) 2012 JK Laiho.
//

#import "NSDate+JKLRelativeTime.h"

NSString* pluralSuffix(int);

// TODO Yeah this is really bad for now. Quick non-DRY hack.
// Make this a lot less naive. Flexibility, localization...
// Also, unit tests.

@implementation NSDate (JKLRelativeTime)

+ (NSString *)relativeTimeStringSinceDate:(NSDate *)anotherDate {
    double interval = -[anotherDate timeIntervalSinceNow];
    
    if (interval >= 0 && interval < 60) {
        return @"just now";
    } else if (interval < 60 * 60) {
        int difference = round(interval / 60);
        NSString * plural = pluralSuffix(difference);
        return [NSString stringWithFormat:@"%d minute%@ ago", difference, plural];
    } else if (interval < 60 * 60 * 24) {
        int difference = round(interval / 60 / 60);
        NSString * plural = pluralSuffix(difference);
        return [NSString stringWithFormat:@"%d hour%@ ago", difference, plural];
    } else if (interval < 60 * 60 * 24 * 31) {
        int difference = round(interval / 60 / 60 / 24);
        NSString * plural = pluralSuffix(difference);
        return [NSString stringWithFormat:@"%d day%@ ago", difference, plural];
    } else {
        int difference = round(interval / 60 / 60 / 24 / 31);
        NSString * plural = pluralSuffix(difference);
        return [NSString stringWithFormat:@"%d month%@ ago", difference, plural];
    }
}

@end

NSString* pluralSuffix(int num)
{
    if (num == 1) return @"";
    return @"s";
}
