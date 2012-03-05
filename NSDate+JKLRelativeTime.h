//
//  NSDate+JKLRelativeTime.m
//
//  Copyright (c) 2012 JK Laiho.
//

#import <Foundation/Foundation.h>

@interface NSDate (JKLRelativeTime)

+ (NSString *)relativeTimeStringSinceDate:(NSDate *)anotherDate;

@end
